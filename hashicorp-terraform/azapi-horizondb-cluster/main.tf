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
  name      = "terraform-azapi-horizondb-cluster"
  location  = local.location
  parent_id = "/subscriptions/${data.azapi_client_config.current.subscription_id}"
  tags = {
    source = "terraform-azapi"
  }
}

resource "azapi_resource" "horizondb_cluster" {
  type      = "Microsoft.HorizonDb/clusters@2026-10-01-preview"
  name      = "example-horizondb-from-terraform-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id

  # The azapi provider doesn't include the schema for this API version yet.
  schema_validation_enabled = false

  body = {
    properties = {
      postgreSqlVersion = "18"
      backup = {
        geoRedundancy = "Disabled"
      }
    }
  }
  tags = {
    source = "terraform-azapi"
  }
}

# The administrator credentials are a singleton which always exists beneath the
# Cluster (and can't be deleted), so it's configured with `azapi_update_resource`
# rather than created with `azapi_resource`.
resource "azapi_update_resource" "password_authentication" {
  type      = "Microsoft.HorizonDb/clusters/authentications@2026-10-01-preview"
  name      = "passwordMethod"
  parent_id = azapi_resource.horizondb_cluster.id
  body = {
    properties = {
      state = "Enabled"
      # This is a local emulator example - real configurations should source
      # the administrator password from a secret (e.g. a variable or Key Vault).
      administratorLogin         = "exampleadmin"
      administratorLoginPassword = "Example-Passw0rd!"
    }
  }
}

resource "azapi_resource" "horizondb_pool" {
  type      = "Microsoft.HorizonDb/clusters/pools@2026-10-01-preview"
  name      = "example-pool"
  parent_id = azapi_resource.horizondb_cluster.id

  # The azapi provider doesn't include the schema for this API version yet.
  schema_validation_enabled = false

  body = {
    properties = {
      nodeCount = 1
      highAvailability = {
        mode = "Disabled"
      }
      computeModel = {
        type              = "Provisioned"
        computeGeneration = 1
        computeProcessor  = "Intel"
        vCores            = 4
      }
    }
  }

  depends_on = [azapi_update_resource.password_authentication]
}

resource "azapi_resource" "firewall_rule" {
  type      = "Microsoft.HorizonDb/clusters/pools/firewallRules@2026-10-01-preview"
  name      = "example-firewall-rule"
  parent_id = azapi_resource.horizondb_pool.id

  # The azapi provider doesn't include the schema for this API version yet.
  schema_validation_enabled = false

  body = {
    properties = {
      description    = "Allows connections from an example IP range."
      startIpAddress = "203.0.113.0"
      endIpAddress   = "203.0.113.255"
    }
  }
}
