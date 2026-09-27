resource keyVault 'Microsoft.KeyVault/vaults@2026-02-01' = {
  name: 'exkvs-bicep'
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

resource secret 'Microsoft.KeyVault/vaults/secrets@2026-02-01' = {
  parent: keyVault
  name: 'example-secret-from-bicep'
  properties: {
    value: 'example-value'
  }
}
