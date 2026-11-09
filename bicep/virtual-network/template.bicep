@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2025-07-01' = {
  name: 'example-vnet-from-bicep'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'subnet-1'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
      {
        name: 'subnet-2'
        properties: {
          addressPrefix: '10.0.2.0/24'
        }
      }
    ]
  }
}