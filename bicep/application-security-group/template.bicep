@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource applicationSecurityGroup 'Microsoft.Network/applicationSecurityGroups@2025-07-01' = {
  name: 'example-asg-from-bicep'
  location: location
  properties: {}
}