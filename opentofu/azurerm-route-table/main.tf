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

resource "azurerm_route_table" "example" {
  name                = "example-route-table-from-opentofu"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name

  route {
    name           = "default-route"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "Internet"
  }

  tags = {
    "source" : "opentofu"
  }
}