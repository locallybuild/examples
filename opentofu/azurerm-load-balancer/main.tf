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
  name                = "example-lb-public-ip-from-opentofu"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = {
    "source" : "opentofu"
  }
}

resource "azurerm_lb" "example" {
  name                = "example-lb-from-opentofu"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "frontend"
    public_ip_address_id = azurerm_public_ip.example.id
  }

  tags = {
    "source" : "opentofu"
  }
}

resource "azurerm_lb_backend_address_pool" "example" {
  name            = "backend"
  loadbalancer_id = azurerm_lb.example.id
}

resource "azurerm_lb_probe" "example" {
  name            = "tcp-80"
  loadbalancer_id = azurerm_lb.example.id
  protocol        = "Tcp"
  port            = 80
}

resource "azurerm_lb_rule" "example" {
  name                           = "http"
  loadbalancer_id                = azurerm_lb.example.id
  frontend_ip_configuration_name = "frontend"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.example.id]
  probe_id                       = azurerm_lb_probe.example.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
}
