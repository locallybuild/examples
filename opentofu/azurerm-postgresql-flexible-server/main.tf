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

resource "azurerm_postgresql_flexible_server" "example" {
  name                = "example-postgresql-from-opentofu"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  version             = "16"
  sku_name            = "B_Standard_B1ms"
  storage_mb          = 32768

  # This is a local emulator example - real configurations should source
  # the administrator password from a secret (e.g. a variable or Key Vault).
  administrator_login    = "exampleadmin"
  administrator_password = "Example-Passw0rd!"

  tags = {
    "source" : "opentofu"
  }
}

resource "azurerm_postgresql_flexible_server_database" "example" {
  name      = "example-database"
  server_id = azurerm_postgresql_flexible_server.example.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}
