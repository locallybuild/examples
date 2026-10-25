terraform {
  required_version = ">= 1.12.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.10.0"
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
  name     = "terraform-azurerm-servicebus-queue"
  location = local.location
  tags = {
    "source" : "terraform"
  }
}

resource "azurerm_servicebus_namespace" "example" {
  name                = "example-sbqueue-from-terraform"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard"
  tags = {
    "source" : "terraform"
  }
}

resource "azurerm_servicebus_queue" "example" {
  name         = "example-queue-from-terraform"
  namespace_id = azurerm_servicebus_namespace.example.id
}
