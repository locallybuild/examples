extension microsoftGraphV1

resource owner 'Microsoft.Graph/users@v1.0' existing = {
  userPrincipalName: 'ada.lovelace@default.tenants.locally'
}

resource firstMember 'Microsoft.Graph/users@v1.0' existing = {
  userPrincipalName: 'grace.hopper@default.tenants.locally'
}

resource secondMember 'Microsoft.Graph/users@v1.0' existing = {
  userPrincipalName: 'alan.turing@default.tenants.locally'
}

resource nestedGroup 'Microsoft.Graph/groups@v1.0' existing = {
  uniqueName: 'research'
}

resource group 'Microsoft.Graph/groups@v1.0' = {
  displayName: 'Example Group from Bicep'
  description: 'An example Security Group provisioned using a Bicep Template.'
  mailEnabled: false
  mailNickname: 'example-group-from-bicep'
  securityEnabled: true
  uniqueName: 'example-group-from-bicep'
  owners: {
    relationships: [
      owner.id
    ]
  }
  members: {
    relationships: [
      firstMember.id
      secondMember.id
      nestedGroup.id
    ]
  }
}

output objectId string = group.id
