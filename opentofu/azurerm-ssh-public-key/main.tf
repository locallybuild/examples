terraform {
  required_version = ">= 1.12.0"

  required_providers {
    azurerm = {
      source  = "opentofu/azurerm"
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
  name     = "opentofu-resources"
  location = local.location
  tags = {
    "source" : "opentofu"
  }
}

resource "azurerm_ssh_public_key" "example" {
  name                = "example-ssh-key-from-opentofu"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  public_key          = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDbY7RIVj+SLjb8thHachpRwpSGOh9C2dE2mond1hNOD62Z6d+tJzIl28grzZLXAqFzCyleJCBVLFWH86GwBZ5deM4lcSkuEHLuy5uvGvLvHZjPFNPfeLUg8J1FzGk9SBtVdVd/SruP99/ZQVkmxM4n1qAsrPN3Pml6PrfH/qTB+G1RO4CfZnttxntVHO47mEnvy/gWNyDUXuRqJJKdKTjuUiYtoo5hQExpR+IQrlzQDgmDNns7PSstuKQQ8JSbyyPb706hfTDBzdf5xkJToH4n2mHtw1lZIN/b6e4jCdItBeNTJ24QXfivSJ3efLUjRfb4bbKOVsMsuFWB6IEUCTcfZWNvjHRGT5peIJTlSnh/Iy4mMpGuGlz1TDoXJO6AzOsKhmuEvh8OJcXrL6+N1QSOW1t5lf150PQkjrEyREJCxGu6bR4f4jPfx51hz5DQsuFpLFjttDkqeIq3D379VGdie29fHgA5GZLiLVb3aScAUJkAFXt1vm5cQ8JH84czsAU= example@example.com"
  tags = {
    "source" : "opentofu"
  }
}