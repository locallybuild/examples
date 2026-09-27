resource storageAccount 'Microsoft.Storage/storageAccounts@2026-04-01' = {
  name: 'exqueuebicep'
  location: 'berlin'
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
