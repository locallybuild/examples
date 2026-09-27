resource containerRegistry 'Microsoft.ContainerRegistry/registries@2025-11-01' = {
  name: 'excrbicep'
  location: 'berlin'
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: false
  }
}
