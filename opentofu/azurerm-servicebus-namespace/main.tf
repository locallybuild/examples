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

resource "azurerm_servicebus_namespace" "example" {
  name                = "example-sbns-from-opentofu"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard"
  tags = {
    "source" : "opentofu"
  }
}
