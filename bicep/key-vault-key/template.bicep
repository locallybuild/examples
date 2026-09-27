resource keyVault 'Microsoft.KeyVault/vaults@2026-02-01' = {
  name: 'exkvk-bicep'
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

resource key 'Microsoft.KeyVault/vaults/keys@2026-02-01' = {
  parent: keyVault
  name: 'example-key-from-bicep'
  properties: {
    kty: 'RSA'
    keySize: 2048
  }
}
