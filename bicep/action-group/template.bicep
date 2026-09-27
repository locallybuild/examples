resource actionGroup 'Microsoft.Insights/actionGroups@2023-01-01' = {
  name: 'example-action-group-from-bicep'
  location: 'global'
  properties: {
    groupShortName: 'exampleag'
    enabled: true
    emailReceivers: [
      {
        name: 'example-email'
        emailAddress: 'example@example.com'
        useCommonAlertSchema: false
      }
    ]
  }
}
