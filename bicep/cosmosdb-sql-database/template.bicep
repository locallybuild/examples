resource cosmosDbAccount 'Microsoft.DocumentDB/databaseAccounts@2026-03-15' = {
  name: 'ex-cosmos-sqldb-from-bicep'
  location: 'berlin'
  kind: 'GlobalDocumentDB'
  properties: {
    databaseAccountOfferType: 'Standard'
    consistencyPolicy: {
      defaultConsistencyLevel: 'Session'
    }
    locations: [
      {
        locationName: 'berlin'
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
