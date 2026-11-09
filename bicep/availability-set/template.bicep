@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource bicep_as 'Microsoft.Compute/availabilitySets@2026-04-01' = {
  name: 'example-from-bicep'
  location: location
  properties: {
    platformFaultDomainCount: 3
    platformUpdateDomainCount: 5
  }
  sku: {
    name: 'Aligned'
  }
}
