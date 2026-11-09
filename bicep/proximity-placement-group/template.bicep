@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource proximityPlacementGroup 'Microsoft.Compute/proximityPlacementGroups@2026-04-01' = {
  name: 'example-ppg-from-bicep'
  location: location
  properties: {
    proximityPlacementGroupType: 'Standard'
  }
}