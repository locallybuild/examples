terraform {
  required_version = ">= 1.12.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.7.0"
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
  name     = "terraform-resources"
  location = local.location
  tags = {
    "source" : "terraform"
  }
}

resource "azurerm_redis_cache" "example" {
  name                 = "example-redis-from-terraform"
  location             = local.location
  resource_group_name  = azurerm_resource_group.example.name
  sku_name             = "Basic"
  family               = "C"
  capacity             = 0
  non_ssl_port_enabled = false
  minimum_tls_version  = "1.2"
  tags = {
    "source" : "terraform"
  }
}
