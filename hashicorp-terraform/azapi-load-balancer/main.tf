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

resource "azapi_resource" "public_ip" {
  type      = "Microsoft.Network/publicIPAddresses@2025-07-01"
  name      = "example-lb-public-ip-from-terraform-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    sku = {
      name = "Standard"
    }
    properties = {
      publicIPAllocationMethod = "Static"
    }
  }
  tags = {
    source = "terraform-azapi"
  }
}

locals {
  load_balancer_name = "example-lb-from-terraform-azapi"
  load_balancer_id   = "${azapi_resource.resource_group.id}/providers/Microsoft.Network/loadBalancers/${local.load_balancer_name}"
}

resource "azapi_resource" "load_balancer" {
  type      = "Microsoft.Network/loadBalancers@2025-07-01"
  name      = local.load_balancer_name
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    sku = {
      name = "Standard"
    }
    properties = {
      frontendIPConfigurations = [
        {
          name = "frontend"
          properties = {
            publicIPAddress = {
              id = azapi_resource.public_ip.id
            }
          }
        }
      ]
      backendAddressPools = [
        {
          name = "backend"
        }
      ]
      probes = [
        {
          name = "tcp-80"
          properties = {
            protocol = "Tcp"
            port     = 80
          }
        }
      ]
      loadBalancingRules = [
        {
          name = "http"
          properties = {
            frontendIPConfiguration = {
              id = "${local.load_balancer_id}/frontendIPConfigurations/frontend"
            }
            backendAddressPool = {
              id = "${local.load_balancer_id}/backendAddressPools/backend"
            }
            probe = {
              id = "${local.load_balancer_id}/probes/tcp-80"
            }
            protocol     = "Tcp"
            frontendPort = 80
            backendPort  = 80
          }
        }
      ]
    }
  }
  tags = {
    source = "terraform-azapi"
  }
}
