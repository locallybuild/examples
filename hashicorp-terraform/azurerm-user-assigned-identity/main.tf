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
  name     = "terraform-azurerm-user-assigned-identity"
  location = local.location
  tags = {
    "source" : "terraform"
  }
}

resource "azurerm_user_assigned_identity" "example" {
  name                = "example-identity-from-terraform"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  tags = {
    "source" : "terraform"
  }
}
