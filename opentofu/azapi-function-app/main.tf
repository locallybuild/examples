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

resource "azapi_resource" "storage_account" {
  type      = "Microsoft.Storage/storageAccounts@2026-04-01"
  name      = "exfuncappopentofuazapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    kind = "StorageV2"
    sku = {
      name = "Standard_LRS"
    }
  }
  tags = {
    source = "opentofu-azapi"
  }
}

resource "azapi_resource_action" "storage_account_keys" {
  type                   = "Microsoft.Storage/storageAccounts@2026-04-01"
  resource_id            = azapi_resource.storage_account.id
  action                 = "listKeys"
  method                 = "POST"
  response_export_values = ["keys"]
}

resource "azapi_resource" "app_service_plan" {
  type      = "Microsoft.Web/serverfarms@2025-03-01"
  name      = "example-function-app-plan-from-opentofu-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    kind = "linux"
    sku = {
      name = "B1"
    }
    properties = {
      reserved = true
    }
  }
  tags = {
    source = "opentofu-azapi"
  }
}

resource "azapi_resource" "function_app" {
  type      = "Microsoft.Web/sites@2025-03-01"
  name      = "example-function-app-from-opentofu-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    kind = "functionapp,linux"
    properties = {
      serverFarmId = azapi_resource.app_service_plan.id
      siteConfig = {
        linuxFxVersion = "Python|3.12"
        appSettings = [
          {
            name  = "AzureWebJobsStorage"
            value = "DefaultEndpointsProtocol=https;AccountName=${azapi_resource.storage_account.name};AccountKey=${azapi_resource_action.storage_account_keys.output.keys[0].value}"
          },
          {
            name  = "FUNCTIONS_EXTENSION_VERSION"
            value = "~4"
          },
          {
            name  = "FUNCTIONS_WORKER_RUNTIME"
            value = "python"
          },
        ]
      }
    }
  }
  tags = {
    source = "opentofu-azapi"
  }
}
