@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource appServicePlan 'Microsoft.Web/serverfarms@2025-03-01' = {
  name: 'example-app-service-plan-from-bicep'
  location: location
  kind: 'linux'
  sku: {
    name: 'B1'
  }
  properties: {
    reserved: true
  }
}
