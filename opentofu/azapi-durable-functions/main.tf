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
  name      = "opentofu-azapi-durable-functions"
  location  = local.location
  parent_id = "/subscriptions/${data.azapi_client_config.current.subscription_id}"
  tags = {
    source = "opentofu-azapi"
  }
}

resource "azapi_resource" "storage_account" {
  type      = "Microsoft.Storage/storageAccounts@2026-04-01"
  name      = "exdurableopentofuazapi"
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

resource "azapi_resource" "scheduler" {
  type      = "Microsoft.DurableTask/schedulers@2026-02-01"
  name      = "example-dts-from-opentofu-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
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
    source = "opentofu-azapi"
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

resource "azapi_resource" "app_service_plan" {
  type      = "Microsoft.Web/serverfarms@2025-03-01"
  name      = "example-durable-functions-plan-from-opentofu-azapi"
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
  name      = "example-durable-functions-from-opentofu-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  identity {
    type = "SystemAssigned"
  }
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
          {
            name  = "DURABLE_TASK_SCHEDULER_CONNECTION_STRING"
            value = "Endpoint=${azapi_resource.scheduler.output.properties.endpoint};Authentication=ManagedIdentity"
          },
          {
            name  = "TASKHUB_NAME"
            value = azapi_resource.task_hub.name
          },
        ]
      }
    }
  }
  tags = {
    source = "opentofu-azapi"
  }
}

# Grants the Function App's System-Assigned Identity access to the Durable Task Scheduler.
resource "azapi_resource" "role_assignment" {
  type      = "Microsoft.Authorization/roleAssignments@2022-04-01"
  name      = uuidv5("url", "${azapi_resource.scheduler.id}/${azapi_resource.function_app.name}/DurableTaskDataContributor")
  parent_id = azapi_resource.scheduler.id
  body = {
    properties = {
      # The built-in Durable Task Data Contributor role.
      roleDefinitionId = "/subscriptions/${data.azapi_client_config.current.subscription_id}/providers/Microsoft.Authorization/roleDefinitions/0ad04412-c4d5-4796-b79c-f76d14c8d402"
      principalId      = azapi_resource.function_app.identity[0].principal_id
      principalType    = "ServicePrincipal"
    }
  }
  # The identity's service principal can take a few seconds to become available.
  retry = {
    error_message_regex = ["PrincipalNotFound"]
  }
}
