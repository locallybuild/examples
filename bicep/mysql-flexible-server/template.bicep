@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource mysqlFlexibleServer 'Microsoft.DBforMySQL/flexibleServers@2024-12-30' = {
  name: 'example-mysql-from-bicep'
  location: location
  sku: {
    name: 'Standard_B1ms'
    tier: 'Burstable'
  }
  properties: {
    version: '8.0.21'
    storage: {
      storageSizeGB: 20
    }
    administratorLogin: 'exampleadmin'
    // This is a local emulator example - real deployments should pass the password in
    // from a secret (e.g. a @secure() parameter sourced from Key Vault).
    #disable-next-line use-secure-value-for-secure-inputs
    administratorLoginPassword: 'Example-Passw0rd!'
  }
}

resource mysqlDatabase 'Microsoft.DBforMySQL/flexibleServers/databases@2024-12-30' = {
  parent: mysqlFlexibleServer
  name: 'example-database'
  properties: {
    charset: 'utf8mb4'
    collation: 'utf8mb4_unicode_ci'
  }
}
