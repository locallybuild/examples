resource serviceBusNamespace 'Microsoft.ServiceBus/namespaces@2026-01-01' = {
  name: 'example-sbns-from-bicep'
  location: 'berlin'
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
}
