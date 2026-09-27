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

resource "azurerm_user_assigned_identity" "example" {
  name                = "example-identity-from-opentofu"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  tags = {
    "source" : "opentofu"
  }
}
