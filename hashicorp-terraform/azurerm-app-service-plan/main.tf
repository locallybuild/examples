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

resource "azurerm_service_plan" "example" {
  name                = "example-app-service-plan-from-terraform"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Linux"
  sku_name            = "B1"
  tags = {
    "source" : "terraform"
  }
}
