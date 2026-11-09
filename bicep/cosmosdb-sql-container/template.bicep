@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource cosmosDbAccount 'Microsoft.DocumentDB/databaseAccounts@2026-03-15' = {
  name: 'ex-cosmos-sqlcont-from-bicep'
  location: location
  kind: 'GlobalDocumentDB'
  properties: {
    databaseAccountOfferType: 'Standard'
    consistencyPolicy: {
      defaultConsistencyLevel: 'Session'
    }
    locations: [
      {
        locationName: location
        failoverPriority: 0
      }
    ]
  }
}

resource sqlDatabase 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2026-03-15' = {
  parent: cosmosDbAccount
  name: 'example-database'
  properties: {
    resource: {
      id: 'example-database'
    }
    options: {
      throughput: 400
    }
  }
}

resource sqlContainer 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers@2026-03-15' = {
  parent: sqlDatabase
  name: 'example-container'
  properties: {
    resource: {
      id: 'example-container'
      partitionKey: {
        paths: [
          '/id'
        ]
        kind: 'Hash'
      }
    }
  }
}
