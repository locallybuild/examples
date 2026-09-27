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

resource "azapi_resource" "eventhub_namespace" {
  type      = "Microsoft.EventHub/namespaces@2026-01-01"
  name      = "example-eh-from-opentofu-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    sku = {
      name     = "Standard"
      tier     = "Standard"
      capacity = 1
    }
  }
  tags = {
    source = "opentofu-azapi"
  }
}

resource "azapi_resource" "eventhub" {
  type      = "Microsoft.EventHub/namespaces/eventhubs@2026-01-01"
  name      = "example-eventhub-from-opentofu-azapi"
  parent_id = azapi_resource.eventhub_namespace.id
  body = {
    properties = {
      partitionCount         = 2
      messageRetentionInDays = 1
    }
  }
}

resource "azapi_resource" "consumer_group" {
  type      = "Microsoft.EventHub/namespaces/eventhubs/consumerGroups@2026-01-01"
  name      = "example-consumer-group-from-opentofu-azapi"
  parent_id = azapi_resource.eventhub.id
  body = {
    properties = {}
  }
}
