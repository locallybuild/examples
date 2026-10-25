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
  name     = "terraform-azurerm-app-configuration"
  location = local.location
  tags = {
    "source" : "terraform"
  }
}

resource "azurerm_app_configuration" "example" {
  name                = "example-appconfig-from-terraform"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "free"
  tags = {
    "source" : "terraform"
  }
}
