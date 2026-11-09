@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource topic 'Microsoft.EventGrid/topics@2025-02-15' = {
  name: 'example-egtopic-from-bicep'
  location: location
  properties: {}
}
