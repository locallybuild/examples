resource lock 'Microsoft.Authorization/locks@2020-05-01' = {
  name: 'example-lock-from-bicep'
  properties: {
    level: 'CanNotDelete'
    notes: 'Prevents accidental deletion of the resource group'
  }
}
