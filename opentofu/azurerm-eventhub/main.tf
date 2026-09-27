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

resource "azurerm_eventhub_namespace" "example" {
  name                = "example-eh-from-opentofu"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard"
  capacity            = 1
  tags = {
    "source" : "opentofu"
  }
}

resource "azurerm_eventhub" "example" {
  name              = "example-eventhub-from-opentofu"
  namespace_id      = azurerm_eventhub_namespace.example.id
  partition_count   = 2
  message_retention = 1
}

resource "azurerm_eventhub_consumer_group" "example" {
  name                = "example-consumer-group-from-opentofu"
  namespace_name      = azurerm_eventhub_namespace.example.name
  eventhub_name       = azurerm_eventhub.example.name
  resource_group_name = azurerm_resource_group.example.name
}
