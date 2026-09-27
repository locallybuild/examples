resource storageAccount 'Microsoft.Storage/storageAccounts@2026-04-01' = {
  name: 'exsharebicep'
  location: 'berlin'
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

resource fileService 'Microsoft.Storage/storageAccounts/fileServices@2026-04-01' existing = {
  parent: storageAccount
  name: 'default'
}

resource share 'Microsoft.Storage/storageAccounts/fileServices/shares@2026-04-01' = {
  parent: fileService
  name: 'example-share-from-bicep'
  properties: {
    shareQuota: 50
  }
}
