@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource workspace 'Microsoft.OperationalInsights/workspaces@2025-07-01' = {
  name: 'example-workspace-from-bicep'
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}
