@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource serviceBusNamespace 'Microsoft.ServiceBus/namespaces@2026-01-01' = {
  name: 'example-sbqueue-from-bicep'
  location: location
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
}

resource queue 'Microsoft.ServiceBus/namespaces/queues@2026-01-01' = {
  parent: serviceBusNamespace
  name: 'example-queue-from-bicep'
  properties: {}
}
