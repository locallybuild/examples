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
  name      = "terraform-azapi-resources"
  location  = local.location
  parent_id = "/subscriptions/${data.azapi_client_config.current.subscription_id}"
  tags = {
    source = "terraform-azapi"
  }
}

resource "azapi_resource" "container_registry" {
  type      = "Microsoft.ContainerRegistry/registries@2025-11-01"
  name      = "excrterraformazapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    sku = {
      name = "Basic"
    }
    properties = {
      adminUserEnabled = false
    }
  }
  tags = {
    source = "terraform-azapi"
  }
}
