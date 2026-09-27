resource storageAccount 'Microsoft.Storage/storageAccounts@2026-04-01' = {
  name: 'exstacctbicep'
  location: 'berlin'
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}
