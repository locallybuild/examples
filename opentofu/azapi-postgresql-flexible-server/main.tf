terraform {
  required_version = ">= 1.12.0"

  required_providers {
    azapi = {
      source  = "Azure/azapi"
      version = "=2.12.0"
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
  name      = "opentofu-azapi-resources"
  location  = local.location
  parent_id = "/subscriptions/${data.azapi_client_config.current.subscription_id}"
  tags = {
    source = "opentofu-azapi"
  }
}

resource "azapi_resource" "postgresql_flexible_server" {
  type      = "Microsoft.DBforPostgreSQL/flexibleServers@2025-08-01"
  name      = "example-postgresql-from-opentofu-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    sku = {
      name = "Standard_B1ms"
      tier = "Burstable"
    }
    properties = {
      version = "16"
      storage = {
        storageSizeGB = 32
      }
      # This is a local emulator example - real configurations should source
      # the administrator password from a secret (e.g. a variable or Key Vault).
      administratorLogin         = "exampleadmin"
      administratorLoginPassword = "Example-Passw0rd!"
    }
  }
  tags = {
    source = "opentofu-azapi"
  }
}

resource "azapi_resource" "postgresql_database" {
  type      = "Microsoft.DBforPostgreSQL/flexibleServers/databases@2025-08-01"
  name      = "example-database"
  parent_id = azapi_resource.postgresql_flexible_server.id
  body = {
    properties = {
      charset   = "UTF8"
      collation = "en_US.utf8"
    }
  }
}
