@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource eventHubNamespace 'Microsoft.EventHub/namespaces@2026-01-01' = {
  name: 'example-ehns-from-bicep'
  location: location
  sku: {
    name: 'Standard'
    tier: 'Standard'
    capacity: 1
  }
}
