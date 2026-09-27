terraform {
  required_version = ">= 1.12.0"

  required_providers {
    azapi = {
      source  = "Azure/azapi"
      version = "=2.12.0"
    }
  }
}
provider "azapi" {}

data "azapi_client_config" "current" {}

locals {
  location = "berlin"
}

resource "azapi_resource" "resource_group" {
  type      = "Microsoft.Resources/resourceGroups@2025-04-01"
  name      = "opentofu-azapi-resources"
  location  = local.location
  parent_id = "/subscriptions/${data.azapi_client_config.current.subscription_id}"
  tags = {
    source = "opentofu-azapi"
  }
}

resource "azapi_resource" "redis_cache" {
  type      = "Microsoft.Cache/redis@2024-11-01"
  name      = "example-redis-from-opentofu-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    properties = {
      sku = {
        name     = "Basic"
        family   = "C"
        capacity = 0
      }
      enableNonSslPort  = false
      minimumTlsVersion = "1.2"
    }
  }
  tags = {
    source = "opentofu-azapi"
  }
}
