@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource publicIPAddress 'Microsoft.Network/publicIPAddresses@2025-07-01' = {
  name: 'example-public-ip-from-bicep'
  location: location
  properties: {
    publicIPAllocationMethod: 'Static'
  }
  sku: {
    name: 'Standard'
  }
}