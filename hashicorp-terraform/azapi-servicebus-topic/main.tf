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

resource "azapi_resource" "servicebus_namespace" {
  type      = "Microsoft.ServiceBus/namespaces@2026-01-01"
  name      = "example-sbtopic-from-terraform-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    sku = {
      name = "Standard"
      tier = "Standard"
    }
  }
  tags = {
    source = "terraform-azapi"
  }
}

resource "azapi_resource" "servicebus_topic" {
  type      = "Microsoft.ServiceBus/namespaces/topics@2026-01-01"
  name      = "example-topic-from-terraform-azapi"
  parent_id = azapi_resource.servicebus_namespace.id
  body = {
    properties = {}
  }
}

resource "azapi_resource" "servicebus_subscription" {
  type      = "Microsoft.ServiceBus/namespaces/topics/subscriptions@2026-01-01"
  name      = "example-subscription-from-terraform-azapi"
  parent_id = azapi_resource.servicebus_topic.id
  body = {
    properties = {
      maxDeliveryCount = 10
    }
  }
}
