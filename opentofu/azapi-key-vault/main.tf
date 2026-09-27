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
  location       = "berlin"
  key_vault_name = "exkv-opentofu-azapi"
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

# Key Vaults are soft-deleted, which reserves the name; purge on destroy so it can be re-created.
resource "azapi_resource_action" "purge_key_vault" {
  type        = "Microsoft.KeyVault/locations/deletedVaults@2026-02-01"
  resource_id = "/subscriptions/${data.azapi_client_config.current.subscription_id}/providers/Microsoft.KeyVault/locations/${local.location}/deletedVaults/${local.key_vault_name}"
  action      = "purge"
  method      = "POST"
  when        = "destroy"
}

resource "azapi_resource" "key_vault" {
  type      = "Microsoft.KeyVault/vaults@2026-02-01"
  name      = local.key_vault_name
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    properties = {
      tenantId = data.azapi_client_config.current.tenant_id
      sku = {
        family = "A"
        name   = "standard"
      }
      enableRbacAuthorization = true
    }
  }
  tags = {
    source = "opentofu-azapi"
  }

  depends_on = [azapi_resource_action.purge_key_vault]
}
