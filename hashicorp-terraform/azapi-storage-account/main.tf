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

resource "azapi_resource" "storage_account" {
  type      = "Microsoft.Storage/storageAccounts@2026-04-01"
  name      = "exstacctterraformazapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    kind = "StorageV2"
    sku = {
      name = "Standard_LRS"
    }
  }
  tags = {
    source = "terraform-azapi"
  }
}
