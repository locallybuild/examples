@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource storageAccount 'Microsoft.Storage/storageAccounts@2026-04-01' = {
  name: 'exstacctbicep'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}
