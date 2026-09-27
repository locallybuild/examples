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

resource "azurerm_log_analytics_workspace" "example" {
  name                = "example-workspace-from-terraform"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags = {
    "source" : "terraform"
  }
}

resource "azurerm_application_insights" "example" {
  name                = "example-appinsights-from-terraform"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  workspace_id        = azurerm_log_analytics_workspace.example.id
  application_type    = "web"
  tags = {
    "source" : "terraform"
  }
}
