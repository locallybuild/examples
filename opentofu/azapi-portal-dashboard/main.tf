terraform {
  required_version = ">= 1.12.0"

  required_providers {
    azapi = {
      source  = "Azure/azapi"
      version = "2.13.0"
    }
  }
}
provider "azapi" {}

data "azapi_client_config" "current" {}

locals {
  location = "berlin"
}

resource "azapi_resource" "resource_group" {
  type      = "Microsoft.Resources/resourceGroups@2025-04-01"
  name      = "opentofu-azapi-portal-dashboard"
  location  = local.location
  parent_id = "/subscriptions/${data.azapi_client_config.current.subscription_id}"
  tags = {
    source = "opentofu-azapi"
  }
}

resource "azapi_resource" "dashboard" {
  type      = "Microsoft.Portal/dashboards@2025-04-01-preview"
  name      = "dashboard-tofu-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    properties = {
      lenses = [
        {
          order = 0
          parts = [
            {
              position = {
                x       = 0
                y       = 0
                colSpan = 6
                rowSpan = 3
              }
              metadata = {
                inputs = []
                type   = "Extension/HubsExtension/PartType/MarkdownPart"
                settings = {
                  content = {
                    content  = "## Welcome\nThis Dashboard was deployed to Locally using OpenTofu and the `Azure/azapi` provider."
                    title    = "Example Dashboard"
                    subtitle = "Deployed using OpenTofu"
                  }
                }
              }
            },
            {
              position = {
                x       = 6
                y       = 0
                colSpan = 6
                rowSpan = 3
              }
              metadata = {
                inputs = []
                type   = "Extension/HubsExtension/PartType/MarkdownPart"
                settings = {
                  content = {
                    content  = "* [Locally](https://locally.build)\n* [Examples](https://github.com/locallybuild/examples)"
                    title    = "Useful Links"
                    subtitle = ""
                  }
                }
              }
            },
          ]
        },
      ]
      metadata = {
        model = {
          timeRange = {
            value = {
              relative = {
                duration = 24
                timeUnit = 1
              }
            }
            type = "MsPortalFx.Composition.Configuration.ValueTypes.TimeRange"
          }
        }
      }
    }
  }
  tags = {
    source         = "opentofu-azapi"
    "hidden-title" = "Example Dashboard (OpenTofu, azapi)"
  }
}
