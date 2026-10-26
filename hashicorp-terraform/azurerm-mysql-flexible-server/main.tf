terraform {
  required_version = ">= 1.12.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.11.0"
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
  name     = "terraform-azurerm-mysql-flexible-server"
  location = local.location
  tags = {
    "source" : "terraform"
  }
}

resource "azurerm_mysql_flexible_server" "example" {
  name                = "example-mysql-from-terraform"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  version             = "8.0.21"
  sku_name            = "B_Standard_B1ms"

  storage {
    size_gb = 20
  }

  # This is a local emulator example - real configurations should source
  # the administrator password from a secret (e.g. a variable or Key Vault).
  administrator_login    = "exampleadmin"
  administrator_password = "Example-Passw0rd!"

  tags = {
    "source" : "terraform"
  }
}

resource "azurerm_mysql_flexible_database" "example" {
  name                = "example-database"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_mysql_flexible_server.example.name
  charset             = "utf8mb4"
  collation           = "utf8mb4_unicode_ci"
}
