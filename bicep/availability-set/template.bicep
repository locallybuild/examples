resource bicep_as 'Microsoft.Compute/availabilitySets@2026-04-01' = {
  name: 'example-from-bicep'
  location: 'berlin'
  properties: {
    platformFaultDomainCount: 3
    platformUpdateDomainCount: 5
  }
  sku: {
    name: 'Aligned'
  }
}
