terraform {
  required_version = ">= 1.12.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.12.0"
    }
  }
}
provider "azurerm" {
  features {}
}

locals {
  location = "berlin"
}

resource "azurerm_resource_group" "example" {
  name     = "terraform-azurerm-portal-dashboard"
  location = local.location
  tags = {
    "source" : "terraform"
  }
}

resource "azurerm_portal_dashboard" "example" {
  name                = "dashboard-tf-azurerm"
  resource_group_name = azurerm_resource_group.example.name
  location            = local.location

  # The `hashicorp/azurerm` provider uses API Version `2019-01-01-preview`, in
  # which `lenses` and `parts` are objects keyed by their order.
  dashboard_properties = jsonencode({
    lenses = {
      "0" = {
        order = 0
        parts = {
          "0" = {
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
                  settings = {
                    content  = "## Welcome\nThis Dashboard was deployed to Locally using Terraform and the `hashicorp/azurerm` provider."
                    title    = "Example Dashboard"
                    subtitle = "Deployed using Terraform"
                  }
                }
              }
            }
          }
          "1" = {
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
                  settings = {
                    content  = "* [Locally](https://locally.build)\n* [Examples](https://github.com/locallybuild/examples)"
                    title    = "Useful Links"
                    subtitle = ""
                  }
                }
              }
            }
          }
        }
      }
    }
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
  })

  tags = {
    "source" : "terraform"
    "hidden-title" : "Example Dashboard (Terraform, azurerm)"
  }
}
