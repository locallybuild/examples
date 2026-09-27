resource workspace 'Microsoft.OperationalInsights/workspaces@2025-07-01' = {
  name: 'example-workspace-from-bicep'
  location: 'berlin'
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}

resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'example-appinsights-from-bicep'
  location: 'berlin'
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: workspace.id
  }
}
