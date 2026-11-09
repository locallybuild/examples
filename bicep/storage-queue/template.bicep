@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource storageAccount 'Microsoft.Storage/storageAccounts@2026-04-01' = {
  name: 'exqueuebicep'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

resource queueService 'Microsoft.Storage/storageAccounts/queueServices@2026-04-01' existing = {
  parent: storageAccount
  name: 'default'
}

resource queue 'Microsoft.Storage/storageAccounts/queueServices/queues@2026-04-01' = {
  parent: queueService
  name: 'example-queue-from-bicep'
  properties: {}
}
