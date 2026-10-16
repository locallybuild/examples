extension microsoftGraphV1

@description('The User Principal Name of the User to look up - defaults to Ada Lovelace, from the example directory seeded into Locally.')
param userPrincipalName string = 'ada.lovelace@default.tenants.locally'

resource user 'Microsoft.Graph/users@v1.0' existing = {
  userPrincipalName: userPrincipalName
}

output objectId string = user.id
output displayName string = user.displayName
output jobTitle string = user.jobTitle
