resource eventHubNamespace 'Microsoft.EventHub/namespaces@2026-01-01' = {
  name: 'example-ehns-from-bicep'
  location: 'berlin'
  sku: {
    name: 'Standard'
    tier: 'Standard'
    capacity: 1
  }
}
