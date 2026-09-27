resource keyVault 'Microsoft.KeyVault/vaults@2026-02-01' = {
  name: 'exkv-bicep'
  location: 'berlin'
  properties: {
    tenantId: subscription().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    enableRbacAuthorization: true
  }
}
