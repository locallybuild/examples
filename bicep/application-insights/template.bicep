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

resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'example-appinsights-from-bicep'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: workspace.id
  }
}
