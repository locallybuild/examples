terraform {
  required_version = ">= 1.12.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
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
  name     = "terraform-resources"
  location = local.location
  tags = {
    "source" : "terraform"
  }
}

resource "azurerm_storage_account" "example" {
  name                     = "exqueueterraform"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = local.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    "source" : "terraform"
  }
}

resource "azurerm_storage_queue" "example" {
  name               = "example-queue-from-terraform"
  storage_account_id = azurerm_storage_account.example.id
}
