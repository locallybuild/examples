@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource identity 'Microsoft.ManagedIdentity/userAssignedIdentities@2024-11-30' = {
  name: 'example-identity-from-bicep'
  location: location
}
