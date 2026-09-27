resource serviceBusNamespace 'Microsoft.ServiceBus/namespaces@2026-01-01' = {
  name: 'example-sbqueue-from-bicep'
  location: 'berlin'
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
