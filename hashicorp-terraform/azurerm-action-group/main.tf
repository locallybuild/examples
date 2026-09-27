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

resource "azurerm_monitor_action_group" "example" {
  name                = "example-action-group-from-terraform"
  resource_group_name = azurerm_resource_group.example.name
  short_name          = "exampleag"
  location            = "global"

  email_receiver {
    name          = "example-email"
    email_address = "example@example.com"
  }

  tags = {
    "source" : "terraform"
  }
}
