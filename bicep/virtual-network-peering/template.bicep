resource virtualNetwork1 'Microsoft.Network/virtualNetworks@2025-07-01' = {
  name: 'example-vnet-1-from-bicep'
  location: 'berlin'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
  }
}

resource virtualNetwork2 'Microsoft.Network/virtualNetworks@2025-07-01' = {
  name: 'example-vnet-2-from-bicep'
  location: 'berlin'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.1.0.0/16'
      ]
    }
  }
}

resource peering1To2 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2025-07-01' = {
  parent: virtualNetwork1
  name: 'example-peering-1-to-2-from-bicep'
  properties: {
    allowVirtualNetworkAccess: true
    remoteVirtualNetwork: {
      id: virtualNetwork2.id
    }
  }
}

resource peering2To1 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2025-07-01' = {
  parent: virtualNetwork2
  name: 'example-peering-2-to-1-from-bicep'
  properties: {
    allowVirtualNetworkAccess: true
    remoteVirtualNetwork: {
      id: virtualNetwork1.id
    }
  }
}
