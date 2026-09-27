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
  name     = "dotnet-servicebus-resources"
  location = local.location
  tags = {
    "source" : "terraform"
  }
}

resource "azurerm_servicebus_namespace" "example" {
  name                = "example-dotnet-servicebus-namespace"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard"
  tags = {
    "source" : "terraform"
  }
}

resource "azurerm_servicebus_queue" "example" {
  name         = "example-queue"
  namespace_id = azurerm_servicebus_namespace.example.id
}
