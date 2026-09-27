resource appConfiguration 'Microsoft.AppConfiguration/configurationStores@2024-06-01' = {
  name: 'example-appconfig-from-bicep'
  location: 'berlin'
  sku: {
    name: 'free'
  }
}
