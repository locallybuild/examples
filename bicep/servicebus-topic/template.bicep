@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource serviceBusNamespace 'Microsoft.ServiceBus/namespaces@2026-01-01' = {
  name: 'example-sbtopic-from-bicep'
  location: location
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
}

resource topic 'Microsoft.ServiceBus/namespaces/topics@2026-01-01' = {
  parent: serviceBusNamespace
  name: 'example-topic-from-bicep'
  properties: {}
}

resource subscription 'Microsoft.ServiceBus/namespaces/topics/subscriptions@2026-01-01' = {
  parent: topic
  name: 'example-subscription-from-bicep'
  properties: {
    maxDeliveryCount: 10
  }
}
