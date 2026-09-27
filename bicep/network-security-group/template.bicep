resource networkSecurityGroup 'Microsoft.Network/networkSecurityGroups@2025-07-01' = {
  name: 'example-nsg-from-bicep'
  location: 'berlin'
  properties: {
    securityRules: [
      {
        name: 'allow-https-inbound'
        properties: {
          priority: 100
          direction: 'Inbound'
          access: 'Allow'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '443'
          sourceAddressPrefix: 'Internet'
          destinationAddressPrefix: '*'
        }
      }
    ]
  }
}
