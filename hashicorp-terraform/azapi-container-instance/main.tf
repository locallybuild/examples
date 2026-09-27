terraform {
  required_version = ">= 1.12.0"

  required_providers {
    azapi = {
      source  = "Azure/azapi"
      version = "=2.12.0"
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
  name      = "terraform-azapi-resources"
  location  = local.location
  parent_id = "/subscriptions/${data.azapi_client_config.current.subscription_id}"
  tags = {
    source = "terraform-azapi"
  }
}

resource "azapi_resource" "container_group" {
  type      = "Microsoft.ContainerInstance/containerGroups@2025-09-01"
  name      = "example-containergroup-from-terraform-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    properties = {
      osType = "Linux"
      containers = [
        {
          name = "hello-world"
          properties = {
            image = "mcr.microsoft.com/azuredocs/aci-helloworld"
            resources = {
              requests = {
                cpu        = 1.0
                memoryInGB = 1.5
              }
            }
            ports = [
              { port = 80, protocol = "TCP" }
            ]
          }
        }
      ]
      ipAddress = {
        type = "Public"
        ports = [
          { port = 80, protocol = "TCP" }
        ]
      }
    }
  }
  tags = {
    source = "terraform-azapi"
  }
}
