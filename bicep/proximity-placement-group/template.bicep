resource proximityPlacementGroup 'Microsoft.Compute/proximityPlacementGroups@2026-04-01' = {
  name: 'example-ppg-from-bicep'
  location: 'berlin'
  properties: {
    proximityPlacementGroupType: 'Standard'
  }
}