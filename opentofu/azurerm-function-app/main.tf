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

resource "azurerm_storage_account" "example" {
  name                     = "exfuncappopentofusa"
  location                 = local.location
  resource_group_name      = azurerm_resource_group.example.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    "source" : "opentofu"
  }
}

resource "azurerm_service_plan" "example" {
  name                = "example-function-app-plan-from-opentofu"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Linux"
  sku_name            = "B1"
  tags = {
    "source" : "opentofu"
  }
}

resource "azurerm_linux_function_app" "example" {
  name                       = "example-function-app-from-opentofu"
  location                   = local.location
  resource_group_name        = azurerm_resource_group.example.name
  service_plan_id            = azurerm_service_plan.example.id
  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key

  site_config {
    application_stack {
      python_version = "3.12"
    }
  }
  tags = {
    "source" : "opentofu"
  }
}
