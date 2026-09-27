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


resource "azurerm_public_ip" "example" {
  name                = "example-nat-public-ip-from-opentofu"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = {
    "source" : "opentofu"
  }
}

resource "azurerm_nat_gateway" "example" {
  name                = "example-nat-gateway-from-opentofu"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  sku_name            = "Standard"
  tags = {
    "source" : "opentofu"
  }
}

resource "azurerm_nat_gateway_public_ip_association" "example" {
  nat_gateway_id       = azurerm_nat_gateway.example.id
  public_ip_address_id = azurerm_public_ip.example.id
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

resource "azurerm_subnet" "example" {
  name                 = "subnet-1"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet_nat_gateway_association" "example" {
  subnet_id      = azurerm_subnet.example.id
  nat_gateway_id = azurerm_nat_gateway.example.id
}
