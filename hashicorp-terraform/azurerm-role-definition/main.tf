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

resource "azurerm_role_definition" "example" {
  name              = "example-role-definition-from-terraform"
  scope             = azurerm_resource_group.example.id
  description       = "Read-only access to the resource group and its resources"
  assignable_scopes = [azurerm_resource_group.example.id]

  permissions {
    actions = [
      "Microsoft.Resources/subscriptions/resourceGroups/read",
      "Microsoft.Resources/subscriptions/resourceGroups/resources/read",
    ]
    not_actions = []
  }
}
