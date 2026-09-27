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

resource "azapi_resource" "virtual_network_1" {
  type      = "Microsoft.Network/virtualNetworks@2025-07-01"
  name      = "example-vnet-1-from-opentofu-azapi"
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
    source = "opentofu-azapi"
  }
}

resource "azapi_resource" "virtual_network_2" {
  type      = "Microsoft.Network/virtualNetworks@2025-07-01"
  name      = "example-vnet-2-from-opentofu-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    properties = {
      addressSpace = {
        addressPrefixes = ["10.1.0.0/16"]
      }
    }
  }
  tags = {
    source = "opentofu-azapi"
  }
}

resource "azapi_resource" "peering_1_to_2" {
  type      = "Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2025-07-01"
  name      = "example-peering-1-to-2-from-opentofu-azapi"
  parent_id = azapi_resource.virtual_network_1.id
  body = {
    properties = {
      allowVirtualNetworkAccess = true
      remoteVirtualNetwork = {
        id = azapi_resource.virtual_network_2.id
      }
    }
  }
}

resource "azapi_resource" "peering_2_to_1" {
  type      = "Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2025-07-01"
  name      = "example-peering-2-to-1-from-opentofu-azapi"
  parent_id = azapi_resource.virtual_network_2.id
  body = {
    properties = {
      allowVirtualNetworkAccess = true
      remoteVirtualNetwork = {
        id = azapi_resource.virtual_network_1.id
      }
    }
  }
}
