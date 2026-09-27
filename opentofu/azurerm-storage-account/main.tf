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

resource "azurerm_storage_account" "example" {
  name                     = "exstacctopentofu"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = local.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    "source" : "opentofu"
  }
}
