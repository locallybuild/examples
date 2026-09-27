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


resource "azurerm_virtual_network" "first" {
  name                = "example-vnet-1-from-opentofu"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
  tags = {
    "source" : "opentofu"
  }
}

resource "azurerm_virtual_network" "second" {
  name                = "example-vnet-2-from-opentofu"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.1.0.0/16"]
  tags = {
    "source" : "opentofu"
  }
}

resource "azurerm_virtual_network_peering" "first_to_second" {
  name                      = "example-peering-1-to-2-from-opentofu"
  resource_group_name       = azurerm_resource_group.example.name
  virtual_network_name      = azurerm_virtual_network.first.name
  remote_virtual_network_id = azurerm_virtual_network.second.id
}

resource "azurerm_virtual_network_peering" "second_to_first" {
  name                      = "example-peering-2-to-1-from-opentofu"
  resource_group_name       = azurerm_resource_group.example.name
  virtual_network_name      = azurerm_virtual_network.second.name
  remote_virtual_network_id = azurerm_virtual_network.first.id
}
