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

resource "azapi_resource" "role_definition" {
  type      = "Microsoft.Authorization/roleDefinitions@2022-05-01-preview"
  name      = uuidv5("url", "${azapi_resource.resource_group.id}/example-role-definition-from-terraform-azapi")
  parent_id = azapi_resource.resource_group.id
  body = {
    properties = {
      roleName    = "example-role-definition-from-terraform-azapi"
      description = "Read-only access to the resource group and its resources"
      type        = "CustomRole"
      permissions = [
        {
          actions = [
            "Microsoft.Resources/subscriptions/resourceGroups/read",
            "Microsoft.Resources/subscriptions/resourceGroups/resources/read",
          ]
          notActions     = []
          dataActions    = []
          notDataActions = []
        }
      ]
      assignableScopes = [azapi_resource.resource_group.id]
    }
  }
}
