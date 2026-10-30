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
  name      = "opentofu-azapi-api-management"
  location  = local.location
  parent_id = "/subscriptions/${data.azapi_client_config.current.subscription_id}"
  tags = {
    source = "opentofu-azapi"
  }
}

resource "azapi_resource" "api_management" {
  type      = "Microsoft.ApiManagement/service@2024-05-01"
  name      = "example-apim-from-opentofu-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    sku = {
      name     = "Developer"
      capacity = 1
    }
    properties = {
      publisherEmail = "admin@example.com"
      publisherName  = "Example Publisher"
    }
  }
  tags = {
    source = "opentofu-azapi"
  }
}

resource "azapi_resource" "api" {
  type      = "Microsoft.ApiManagement/service/apis@2024-05-01"
  name      = "example-api"
  parent_id = azapi_resource.api_management.id
  body = {
    properties = {
      displayName = "Example API"
      path        = "example"
      protocols   = ["https"]
      serviceUrl  = "https://httpbin.org"
    }
  }
}

resource "azapi_resource" "api_operation" {
  type      = "Microsoft.ApiManagement/service/apis/operations@2024-05-01"
  name      = "get-status"
  parent_id = azapi_resource.api.id
  body = {
    properties = {
      displayName = "Get Status"
      method      = "GET"
      urlTemplate = "/status/{code}"
      templateParameters = [
        {
          name     = "code"
          type     = "number"
          required = true
        },
      ]
    }
  }
}
