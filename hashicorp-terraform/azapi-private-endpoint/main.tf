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

resource "azapi_resource" "virtual_network" {
  type      = "Microsoft.Network/virtualNetworks@2025-07-01"
  name      = "example-vnet-from-terraform-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    properties = {
      addressSpace = {
        addressPrefixes = ["10.0.0.0/16"]
      }
    }
  }
  tags = {
    source = "terraform-azapi"
  }
}

resource "azapi_resource" "subnet" {
  type      = "Microsoft.Network/virtualNetworks/subnets@2025-07-01"
  name      = "subnet-1"
  parent_id = azapi_resource.virtual_network.id
  body = {
    properties = {
      addressPrefix = "10.0.1.0/24"
    }
  }
}

resource "azapi_resource" "storage_account" {
  type      = "Microsoft.Storage/storageAccounts@2026-04-01"
  name      = "expeazapiterraformsa"
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

resource "azapi_resource" "private_endpoint" {
  type      = "Microsoft.Network/privateEndpoints@2025-07-01"
  name      = "example-private-endpoint-from-terraform-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    properties = {
      subnet = {
        id = azapi_resource.subnet.id
      }
      privateLinkServiceConnections = [
        {
          name = "example-connection-from-terraform-azapi"
          properties = {
            privateLinkServiceId = azapi_resource.storage_account.id
            groupIds             = ["blob"]
          }
        }
      ]
    }
  }
  tags = {
    source = "terraform-azapi"
  }
}
