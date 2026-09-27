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

resource "azurerm_servicebus_namespace" "example" {
  name                = "example-sbtopic-from-terraform"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard"
  tags = {
    "source" : "terraform"
  }
}

resource "azurerm_servicebus_topic" "example" {
  name         = "example-topic-from-terraform"
  namespace_id = azurerm_servicebus_namespace.example.id
}

resource "azurerm_servicebus_subscription" "example" {
  name               = "example-subscription-from-terraform"
  topic_id           = azurerm_servicebus_topic.example.id
  max_delivery_count = 10
}
