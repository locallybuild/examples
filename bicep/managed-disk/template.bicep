@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource managedDisk 'Microsoft.Compute/disks@2026-03-02' = {
  name: 'example-disk-from-bicep'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    creationData: {
      createOption: 'Empty'
    }
    diskSizeGB: 32
  }
}
