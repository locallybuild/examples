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
