@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource dashboard 'Microsoft.Portal/dashboards@2025-04-01-preview' = {
  name: 'example-dashboard-bicep'
  location: location
  tags: {
    'hidden-title': 'Example Dashboard (Bicep)'
  }
  properties: {
    lenses: [
      {
        order: 0
        parts: [
          {
            position: {
              x: 0
              y: 0
              colSpan: 6
              rowSpan: 3
            }
            metadata: {
              inputs: []
              type: 'Extension/HubsExtension/PartType/MarkdownPart'
              settings: {
                content: {
                  content: '## Welcome\nThis Dashboard was deployed to Locally using a Bicep Template.'
                  title: 'Example Dashboard'
                  subtitle: 'Deployed using a Bicep Template'
                }
              }
            }
          }
          {
            position: {
              x: 6
              y: 0
              colSpan: 6
              rowSpan: 3
            }
            metadata: {
              inputs: []
              type: 'Extension/HubsExtension/PartType/MarkdownPart'
              settings: {
                content: {
                  content: '* [Locally](https://locally.build)\n* [Examples](https://github.com/locallybuild/examples)'
                  title: 'Useful Links'
                  subtitle: ''
                }
              }
            }
          }
        ]
      }
    ]
    metadata: {
      model: {
        timeRange: {
          value: {
            relative: {
              duration: 24
              timeUnit: 1
            }
          }
          type: 'MsPortalFx.Composition.Configuration.ValueTypes.TimeRange'
        }
      }
    }
  }
}
