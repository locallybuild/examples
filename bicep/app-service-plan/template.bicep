resource appServicePlan 'Microsoft.Web/serverfarms@2025-03-01' = {
  name: 'example-app-service-plan-from-bicep'
  location: 'berlin'
  kind: 'linux'
  sku: {
    name: 'B1'
  }
  properties: {
    reserved: true
  }
}
