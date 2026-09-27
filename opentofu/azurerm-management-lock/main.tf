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

resource "azurerm_management_lock" "example" {
  name       = "example-lock-from-opentofu"
  scope      = azurerm_resource_group.example.id
  lock_level = "CanNotDelete"
  notes      = "Prevents accidental deletion of the resource group"
}
