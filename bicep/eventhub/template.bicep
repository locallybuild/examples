@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource eventHubNamespace 'Microsoft.EventHub/namespaces@2026-01-01' = {
  name: 'example-eh-from-bicep'
  location: location
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
