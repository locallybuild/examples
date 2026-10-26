terraform {
  required_version = ">= 1.12.0"

  required_providers {
    azurerm = {
      source  = "opentofu/azurerm"
      version = "=5.11.0"
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
  name     = "opentofu-azurerm-api-management"
  location = local.location
  tags = {
    "source" : "opentofu"
  }
}

resource "azurerm_api_management" "example" {
  name                = "example-apim-from-opentofu"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  publisher_name      = "Example Publisher"
  publisher_email     = "admin@example.com"
  sku_name            = "Developer_1"
  tags = {
    "source" : "opentofu"
  }
}

resource "azurerm_api_management_api" "example" {
  name                = "example-api"
  resource_group_name = azurerm_resource_group.example.name
  api_management_name = azurerm_api_management.example.name
  revision            = "1"
  display_name        = "Example API"
  path                = "example"
  protocols           = ["https"]
  service_url         = "https://httpbin.org"
}

resource "azurerm_api_management_api_operation" "example" {
  operation_id        = "get-status"
  api_name            = azurerm_api_management_api.example.name
  api_management_name = azurerm_api_management.example.name
  resource_group_name = azurerm_resource_group.example.name
  display_name        = "Get Status"
  method              = "GET"
  url_template        = "/status/{code}"

  template_parameter {
    name     = "code"
    type     = "number"
    required = true
  }
}
