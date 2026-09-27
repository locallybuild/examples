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

resource "azurerm_availability_set" "example" {
  name                = "example-availability-set"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  tags = {
    "source" : "terraform"
  }
}