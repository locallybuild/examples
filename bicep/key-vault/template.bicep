@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource keyVault 'Microsoft.KeyVault/vaults@2026-02-01' = {
  name: 'exkv-bicep'
  location: location
  properties: {
    tenantId: subscription().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    enableRbacAuthorization: true
  }
}
