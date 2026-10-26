terraform {
  required_version = ">= 1.12.0"

  required_providers {
    azurerm = {
      source  = "opentofu/azurerm"
      version = "=5.11.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "2.13.0"
    }
  }
}
provider "azurerm" {
  features {}
}

# The `opentofu/azurerm` provider doesn't yet support the Durable Task Scheduler,
# so the `Azure/azapi` provider is used to provision it and its Task Hub.
provider "azapi" {}

locals {
  location = "berlin"
}

resource "azurerm_resource_group" "example" {
  name     = "opentofu-azurerm-durable-functions"
  location = local.location
  tags = {
    "source" : "opentofu"
  }
}

resource "azurerm_storage_account" "example" {
  name                     = "exdurableopentofusa"
  location                 = local.location
  resource_group_name      = azurerm_resource_group.example.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    "source" : "opentofu"
  }
}

resource "azapi_resource" "scheduler" {
  type      = "Microsoft.DurableTask/schedulers@2026-02-01"
  name      = "example-dts-from-opentofu"
  location  = local.location
  parent_id = azurerm_resource_group.example.id
  body = {
    properties = {
      ipAllowlist = ["0.0.0.0/0"]
      sku = {
        name = "Consumption"
      }
    }
  }
  response_export_values = ["properties.endpoint"]
  tags = {
    "source" : "opentofu"
  }
}

resource "azapi_resource" "task_hub" {
  type      = "Microsoft.DurableTask/schedulers/taskHubs@2026-02-01"
  name      = "example-task-hub"
  parent_id = azapi_resource.scheduler.id
  body = {
    properties = {}
  }
}

resource "azurerm_service_plan" "example" {
  name                = "example-durable-functions-plan-from-opentofu"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Linux"
  sku_name            = "B1"
  tags = {
    "source" : "opentofu"
  }
}

resource "azurerm_linux_function_app" "example" {
  name                       = "example-durable-functions-from-opentofu"
  location                   = local.location
  resource_group_name        = azurerm_resource_group.example.name
  service_plan_id            = azurerm_service_plan.example.id
  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    "DURABLE_TASK_SCHEDULER_CONNECTION_STRING" = "Endpoint=${azapi_resource.scheduler.output.properties.endpoint};Authentication=ManagedIdentity"
    "TASKHUB_NAME"                             = azapi_resource.task_hub.name
  }

  site_config {
    application_stack {
      python_version = "3.12"
    }
  }
  tags = {
    "source" : "opentofu"
  }
}

# Grants the Function App's System-Assigned Identity access to the Durable Task Scheduler.
resource "azurerm_role_assignment" "example" {
  scope                = azapi_resource.scheduler.id
  role_definition_name = "Durable Task Data Contributor"
  principal_id         = azurerm_linux_function_app.example.identity[0].principal_id
  principal_type       = "ServicePrincipal"
}
