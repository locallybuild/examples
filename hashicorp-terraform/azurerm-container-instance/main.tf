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

resource "azurerm_container_group" "example" {
  name                = "example-containergroup-from-terraform"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Linux"
  ip_address_type     = "Public"
  tags = {
    "source" : "terraform"
  }

  container {
    name   = "hello-world"
    image  = "mcr.microsoft.com/azuredocs/aci-helloworld"
    cpu    = 1.0
    memory = 1.5

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}
