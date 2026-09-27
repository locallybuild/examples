resource eventHubNamespace 'Microsoft.EventHub/namespaces@2026-01-01' = {
  name: 'example-eh-from-bicep'
  location: 'berlin'
  sku: {
    name: 'Standard'
    tier: 'Standard'
    capacity: 1
  }
}

resource eventHub 'Microsoft.EventHub/namespaces/eventhubs@2026-01-01' = {
  parent: eventHubNamespace
  name: 'example-eventhub-from-bicep'
  properties: {
    partitionCount: 2
    messageRetentionInDays: 1
  }
}

resource consumerGroup 'Microsoft.EventHub/namespaces/eventhubs/consumergroups@2026-01-01' = {
  parent: eventHub
  name: 'example-consumer-group-from-bicep'
  properties: {}
}
