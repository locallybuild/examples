@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource appConfiguration 'Microsoft.AppConfiguration/configurationStores@2024-06-01' = {
  name: 'example-appconfig-from-bicep'
  location: location
  sku: {
    name: 'free'
  }
}
