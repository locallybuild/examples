resource postgresqlFlexibleServer 'Microsoft.DBforPostgreSQL/flexibleServers@2025-08-01' = {
  name: 'example-postgresql-from-bicep'
  location: 'berlin'
  sku: {
    name: 'Standard_B1ms'
    tier: 'Burstable'
  }
  properties: {
    version: '16'
    storage: {
      storageSizeGB: 32
    }
    administratorLogin: 'exampleadmin'
    // This is a local emulator example - real deployments should pass the password in
    // from a secret (e.g. a @secure() parameter sourced from Key Vault).
    #disable-next-line use-secure-value-for-secure-inputs
    administratorLoginPassword: 'Example-Passw0rd!'
  }
}

resource postgresqlDatabase 'Microsoft.DBforPostgreSQL/flexibleServers/databases@2025-08-01' = {
  parent: postgresqlFlexibleServer
  name: 'example-database'
  properties: {
    charset: 'UTF8'
    collation: 'en_US.utf8'
  }
}
