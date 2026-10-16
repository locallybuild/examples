extension microsoftGraphV1

var uniqueName = 'example-application-from-bicep'

resource owner 'Microsoft.Graph/users@v1.0' existing = {
  userPrincipalName: 'ada.lovelace@default.tenants.locally'
}

resource application 'Microsoft.Graph/applications@v1.0' = {
  displayName: 'Example Application from Bicep'
  uniqueName: uniqueName
  signInAudience: 'AzureADMyOrg'
  api: {
    requestedAccessTokenVersion: 2
    oauth2PermissionScopes: [
      {
        id: guid(uniqueName, 'Data.Read')
        type: 'User'
        value: 'Data.Read'
        isEnabled: true
        adminConsentDisplayName: 'Read data'
        adminConsentDescription: 'Allows the application to read data on behalf of the signed-in user.'
        userConsentDisplayName: 'Read your data'
        userConsentDescription: 'Allows the application to read your data.'
      }
    ]
  }
  appRoles: [
    {
      id: guid(uniqueName, 'Data.Read.All')
      allowedMemberTypes: [
        'Application'
      ]
      value: 'Data.Read.All'
      isEnabled: true
      displayName: 'Read all data'
      description: 'Allows the application to read all data, without a signed-in user.'
    }
  ]
  owners: {
    relationships: [
      owner.id
    ]
  }
}

output objectId string = application.id
output clientId string = application.appId
