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
  name      = "terraform-azapi-resources"
  location  = local.location
  parent_id = "/subscriptions/${data.azapi_client_config.current.subscription_id}"
  tags = {
    source = "terraform-azapi"
  }
}

resource "azapi_resource" "user_assigned_identity" {
  type                   = "Microsoft.ManagedIdentity/userAssignedIdentities@2024-11-30"
  name                   = "example-identity-from-terraform-azapi"
  location               = local.location
  parent_id              = azapi_resource.resource_group.id
  response_export_values = ["properties.principalId"]
  tags = {
    source = "terraform-azapi"
  }
}

resource "azapi_resource" "role_assignment" {
  type      = "Microsoft.Authorization/roleAssignments@2022-04-01"
  name      = uuidv5("url", "${azapi_resource.resource_group.id}/${azapi_resource.user_assigned_identity.name}/Reader")
  parent_id = azapi_resource.resource_group.id
  body = {
    properties = {
      # The built-in Reader role.
      roleDefinitionId = "/subscriptions/${data.azapi_client_config.current.subscription_id}/providers/Microsoft.Authorization/roleDefinitions/acdd72a7-3385-48ef-bd42-f606fba81ae7"
      principalId      = azapi_resource.user_assigned_identity.output.properties.principalId
      principalType    = "ServicePrincipal"
    }
  }
  # The identity's service principal can take a few seconds to become available.
  retry = {
    error_message_regex = ["PrincipalNotFound"]
  }
}
