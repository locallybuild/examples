resource managedDisk 'Microsoft.Compute/disks@2026-03-02' = {
  name: 'example-disk-from-bicep'
  location: 'berlin'
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
