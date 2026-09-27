terraform {
  required_version = ">= 1.12.0"

  required_providers {
    azurerm = {
      source  = "opentofu/azurerm"
      version = "=5.7.0"
    }
  }
}
provider "azurerm" {
  features {}
}

locals {
  location = "berlin"
}

resource "azurerm_resource_group" "example" {
  name     = "opentofu-resources"
  location = local.location
  tags = {
    "source" : "opentofu"
  }
}


resource "azurerm_private_dns_zone" "example" {
  name                = "example.internal"
  resource_group_name = azurerm_resource_group.example.name
  tags = {
    "source" : "opentofu"
  }
}

resource "azurerm_virtual_network" "example" {
  name                = "example-vnet-from-opentofu"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
  tags = {
    "source" : "opentofu"
  }
}

resource "azurerm_private_dns_zone_virtual_network_link" "example" {
  name                 = "example-vnet-link-from-opentofu"
  private_dns_zone_id  = azurerm_private_dns_zone.example.id
  virtual_network_id   = azurerm_virtual_network.example.id
  registration_enabled = false
  tags = {
    "source" : "opentofu"
  }
}
