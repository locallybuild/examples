@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource routeTable 'Microsoft.Network/routeTables@2025-07-01' = {
  name: 'example-route-table-from-bicep'
  location: location
  properties: {
    routes: [
      {
        name: 'default-route'
        properties: {
          addressPrefix: '0.0.0.0/0'
          nextHopType: 'Internet'
        }
      }
    ]
  }
}