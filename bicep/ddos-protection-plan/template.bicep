@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource ddosProtectionPlan 'Microsoft.Network/ddosProtectionPlans@2025-07-01' = {
  name: 'example-ddos-plan-from-bicep'
  location: location
  properties: {}
}