resource appServicePlan 'Microsoft.Web/serverfarms@2025-03-01' = {
  name: 'example-linux-web-app-plan-from-bicep'
  location: 'berlin'
  kind: 'linux'
  sku: {
    name: 'B1'
  }
  properties: {
    reserved: true
  }
}

resource webApp 'Microsoft.Web/sites@2025-03-01' = {
  name: 'example-linux-web-app-from-bicep'
  location: 'berlin'
  kind: 'app,linux'
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'NODE|22-lts'
    }
  }
}
