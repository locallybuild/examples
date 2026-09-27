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

resource "azapi_resource" "eventgrid_topic" {
  type      = "Microsoft.EventGrid/topics@2025-02-15"
  name      = "example-egtopic-from-terraform-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    properties = {}
  }
  tags = {
    source = "terraform-azapi"
  }
}
