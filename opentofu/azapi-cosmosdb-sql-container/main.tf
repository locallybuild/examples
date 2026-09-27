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

resource "azapi_resource" "cosmosdb_account" {
  type      = "Microsoft.DocumentDB/databaseAccounts@2026-03-15"
  name      = "ex-cosmos-sqlcont-from-opentofu-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    kind = "GlobalDocumentDB"
    properties = {
      databaseAccountOfferType = "Standard"
      consistencyPolicy = {
        defaultConsistencyLevel = "Session"
      }
      locations = [
        {
          locationName     = local.location
          failoverPriority = 0
        }
      ]
    }
  }
  tags = {
    source = "opentofu-azapi"
  }
}

resource "azapi_resource" "sql_database" {
  type      = "Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2026-03-15"
  name      = "example-database"
  parent_id = azapi_resource.cosmosdb_account.id
  body = {
    properties = {
      resource = {
        id = "example-database"
      }
      options = {
        throughput = 400
      }
    }
  }
}

resource "azapi_resource" "sql_container" {
  type      = "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers@2026-03-15"
  name      = "example-container"
  parent_id = azapi_resource.sql_database.id
  body = {
    properties = {
      resource = {
        id = "example-container"
        partitionKey = {
          paths = ["/id"]
          kind  = "Hash"
        }
      }
    }
  }
}
