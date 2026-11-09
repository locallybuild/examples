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
  name: 'subnet-1'
  properties: {
    addressPrefix: '10.0.1.0/24'
  }
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2026-04-01' = {
  name: 'expebicepsa'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

resource privateEndpoint 'Microsoft.Network/privateEndpoints@2025-07-01' = {
  name: 'example-private-endpoint-from-bicep'
  location: location
  properties: {
    subnet: {
      id: subnet.id
    }
    privateLinkServiceConnections: [
      {
        name: 'example-connection-from-bicep'
        properties: {
          privateLinkServiceId: storageAccount.id
          groupIds: [
            'blob'
          ]
        }
      }
    ]
  }
}
