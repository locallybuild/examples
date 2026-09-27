resource redisCache 'Microsoft.Cache/redis@2024-11-01' = {
  name: 'example-redis-from-bicep'
  location: 'berlin'
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
