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

resource "azapi_resource" "action_group" {
  type      = "Microsoft.Insights/actionGroups@2023-01-01"
  name      = "example-action-group-from-terraform-azapi"
  location  = "global"
  parent_id = azapi_resource.resource_group.id
  body = {
    properties = {
      groupShortName = "exampleag"
      enabled        = true
      emailReceivers = [
        {
          name                 = "example-email"
          emailAddress         = "example@example.com"
          useCommonAlertSchema = false
        }
      ]
    }
  }
  tags = {
    source = "terraform-azapi"
  }
}
