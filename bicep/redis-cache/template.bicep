@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource redisCache 'Microsoft.Cache/redis@2024-11-01' = {
  name: 'example-redis-from-bicep'
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 0
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
