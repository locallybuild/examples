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
  }
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2025-07-01' = {
  parent: virtualNetwork
  name: 'internal'
  properties: {
    addressPrefix: '10.0.1.0/24'
  }
}

resource networkInterface 'Microsoft.Network/networkInterfaces@2025-07-01' = {
  name: 'example-nic-from-bicep'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'internal'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: subnet.id
          }
        }
      }
    ]
  }
}
