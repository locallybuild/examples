resource storageAccount 'Microsoft.Storage/storageAccounts@2026-04-01' = {
  name: 'exdurablebicepsa'
  location: 'berlin'
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

resource scheduler 'Microsoft.DurableTask/schedulers@2026-02-01' = {
  name: 'example-dts-from-bicep'
  location: 'berlin'
  properties: {
    ipAllowlist: [
      '0.0.0.0/0'
    ]
    sku: {
      name: 'Consumption'
    }
  }
}

resource taskHub 'Microsoft.DurableTask/schedulers/taskHubs@2026-02-01' = {
  parent: scheduler
  name: 'example-task-hub'
  properties: {}
}

resource appServicePlan 'Microsoft.Web/serverfarms@2025-03-01' = {
  name: 'example-durable-functions-plan-from-bicep'
  location: 'berlin'
  kind: 'linux'
  sku: {
    name: 'B1'
  }
  properties: {
    reserved: true
  }
}

resource functionApp 'Microsoft.Web/sites@2025-03-01' = {
  name: 'example-durable-functions-from-bicep'
  location: 'berlin'
  kind: 'functionapp,linux'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'Python|3.12'
      appSettings: [
        {
          name: 'AzureWebJobsStorage'
          value: 'DefaultEndpointsProtocol=https;AccountName=${storageAccount.name};AccountKey=${storageAccount.listKeys().keys[0].value};EndpointSuffix=${environment().suffixes.storage}'
        }
        {
          name: 'FUNCTIONS_EXTENSION_VERSION'
          value: '~4'
        }
        {
          name: 'FUNCTIONS_WORKER_RUNTIME'
          value: 'python'
        }
        {
          name: 'DURABLE_TASK_SCHEDULER_CONNECTION_STRING'
          value: 'Endpoint=${scheduler.properties.endpoint};Authentication=ManagedIdentity'
        }
        {
          name: 'TASKHUB_NAME'
          value: taskHub.name
        }
      ]
    }
  }
}

var durableTaskDataContributorRoleDefinitionId = subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '0ad04412-c4d5-4796-b79c-f76d14c8d402')

// Grants the Function App's System-Assigned Identity access to the Durable Task Scheduler.
resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: scheduler
  name: guid(scheduler.id, functionApp.id, durableTaskDataContributorRoleDefinitionId)
  properties: {
    roleDefinitionId: durableTaskDataContributorRoleDefinitionId
    principalId: functionApp.identity.principalId
    principalType: 'ServicePrincipal'
  }
}
