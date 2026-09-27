resource publicIPAddress 'Microsoft.Network/publicIPAddresses@2025-07-01' = {
  name: 'example-nat-public-ip-from-bicep'
  location: 'berlin'
  properties: {
    publicIPAllocationMethod: 'Static'
  }
  sku: {
    name: 'Standard'
  }
}

resource natGateway 'Microsoft.Network/natGateways@2025-07-01' = {
  name: 'example-nat-gateway-from-bicep'
  location: 'berlin'
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIpAddresses: [
      {
        id: publicIPAddress.id
      }
    ]
  }
}

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2025-07-01' = {
  name: 'example-vnet-from-bicep'
  location: 'berlin'
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
    natGateway: {
      id: natGateway.id
    }
  }
}
