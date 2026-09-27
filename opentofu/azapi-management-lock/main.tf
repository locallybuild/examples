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

resource "azapi_resource" "management_lock" {
  type      = "Microsoft.Authorization/locks@2020-05-01"
  name      = "example-lock-from-opentofu-azapi"
  parent_id = azapi_resource.resource_group.id
  body = {
    properties = {
      level = "CanNotDelete"
      notes = "Prevents accidental deletion of the resource group"
    }
  }
}
