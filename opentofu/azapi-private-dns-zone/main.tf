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

resource "azapi_resource" "private_dns_zone" {
  type      = "Microsoft.Network/privateDnsZones@2024-06-01"
  name      = "example.internal"
  location  = "global"
  parent_id = azapi_resource.resource_group.id
  tags = {
    source = "opentofu-azapi"
  }
}

resource "azapi_resource" "virtual_network" {
  type      = "Microsoft.Network/virtualNetworks@2025-07-01"
  name      = "example-vnet-from-opentofu-azapi"
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

resource "azapi_resource" "virtual_network_link" {
  type      = "Microsoft.Network/privateDnsZones/virtualNetworkLinks@2024-06-01"
  name      = "example-vnet-link-from-opentofu-azapi"
  location  = "global"
  parent_id = azapi_resource.private_dns_zone.id
  body = {
    properties = {
      registrationEnabled = false
      virtualNetwork = {
        id = azapi_resource.virtual_network.id
      }
    }
  }
  tags = {
    source = "opentofu-azapi"
  }
}
