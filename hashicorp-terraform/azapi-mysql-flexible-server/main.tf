terraform {
  required_version = ">= 1.12.0"

  required_providers {
    azapi = {
      source  = "Azure/azapi"
      version = "2.13.0"
    }
  }
}
provider "azapi" {}

data "azapi_client_config" "current" {}

locals {
  location = "berlin"
}

resource "azapi_resource" "resource_group" {
  type      = "Microsoft.Resources/resourceGroups@2025-04-01"
  name      = "terraform-azapi-mysql-flexible-server"
  location  = local.location
  parent_id = "/subscriptions/${data.azapi_client_config.current.subscription_id}"
  tags = {
    source = "terraform-azapi"
  }
}

resource "azapi_resource" "mysql_flexible_server" {
  type      = "Microsoft.DBforMySQL/flexibleServers@2024-12-30"
  name      = "example-mysql-from-terraform-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    sku = {
      name = "Standard_B1ms"
      tier = "Burstable"
    }
    properties = {
      version = "8.0.21"
      storage = {
        storageSizeGB = 20
      }
      # This is a local emulator example - real configurations should source
      # the administrator password from a secret (e.g. a variable or Key Vault).
      administratorLogin         = "exampleadmin"
      administratorLoginPassword = "Example-Passw0rd!"
    }
  }
  tags = {
    source = "terraform-azapi"
  }
}

resource "azapi_resource" "mysql_database" {
  type      = "Microsoft.DBforMySQL/flexibleServers/databases@2024-12-30"
  name      = "example-database"
  parent_id = azapi_resource.mysql_flexible_server.id
  body = {
    properties = {
      charset   = "utf8mb4"
      collation = "utf8mb4_unicode_ci"
    }
  }
}
