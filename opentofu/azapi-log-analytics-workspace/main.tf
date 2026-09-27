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

resource "azapi_resource" "log_analytics_workspace" {
  type      = "Microsoft.OperationalInsights/workspaces@2025-07-01"
  name      = "example-workspace-from-opentofu-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    properties = {
      sku = {
        name = "PerGB2018"
      }
      retentionInDays = 30
    }
  }
  tags = {
    source = "opentofu-azapi"
  }
}
