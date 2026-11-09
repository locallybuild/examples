@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource storageAccount 'Microsoft.Storage/storageAccounts@2026-04-01' = {
  name: 'exblobbicep'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

resource blobService 'Microsoft.Storage/storageAccounts/blobServices@2026-04-01' existing = {
  parent: storageAccount
  name: 'default'
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2026-04-01' = {
  parent: blobService
  name: 'example-container-from-bicep'
  properties: {
    publicAccess: 'None'
  }
}
