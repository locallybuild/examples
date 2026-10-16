extension microsoftGraphV1

resource application 'Microsoft.Graph/applications@v1.0' = {
  displayName: 'Example Service Principal from Bicep'
  uniqueName: 'example-service-principal-from-bicep'
  signInAudience: 'AzureADMyOrg'
}

resource servicePrincipal 'Microsoft.Graph/servicePrincipals@v1.0' = {
  appId: application.appId
}

output applicationObjectId string = application.id
output servicePrincipalObjectId string = servicePrincipal.id
output clientId string = application.appId
