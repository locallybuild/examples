@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2025-11-01' = {
  name: 'excrbicep'
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: false
  }
}
