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

resource "azapi_resource" "app_service_plan" {
  type      = "Microsoft.Web/serverfarms@2025-03-01"
  name      = "example-linux-web-app-plan-from-opentofu-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    kind = "linux"
    sku = {
      name = "B1"
    }
    properties = {
      reserved = true
    }
  }
  tags = {
    source = "opentofu-azapi"
  }
}

resource "azapi_resource" "web_app" {
  type      = "Microsoft.Web/sites@2025-03-01"
  name      = "example-linux-web-app-from-opentofu-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    kind = "app,linux"
    properties = {
      serverFarmId = azapi_resource.app_service_plan.id
      siteConfig = {
        linuxFxVersion = "NODE|22-lts"
      }
    }
  }
  tags = {
    source = "opentofu-azapi"
  }
}
