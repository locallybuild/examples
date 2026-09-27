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
  name      = "opentofu-azapi-resources"
  location  = local.location
  parent_id = "/subscriptions/${data.azapi_client_config.current.subscription_id}"
  tags = {
    source = "opentofu-azapi"
  }
}

resource "azapi_resource" "ssh_public_key" {
  type      = "Microsoft.Compute/sshPublicKeys@2026-03-01"
  name      = "example-ssh-key-from-opentofu-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    properties = {
      publicKey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDbY7RIVj+SLjb8thHachpRwpSGOh9C2dE2mond1hNOD62Z6d+tJzIl28grzZLXAqFzCyleJCBVLFWH86GwBZ5deM4lcSkuEHLuy5uvGvLvHZjPFNPfeLUg8J1FzGk9SBtVdVd/SruP99/ZQVkmxM4n1qAsrPN3Pml6PrfH/qTB+G1RO4CfZnttxntVHO47mEnvy/gWNyDUXuRqJJKdKTjuUiYtoo5hQExpR+IQrlzQDgmDNns7PSstuKQQ8JSbyyPb706hfTDBzdf5xkJToH4n2mHtw1lZIN/b6e4jCdItBeNTJ24QXfivSJ3efLUjRfb4bbKOVsMsuFWB6IEUCTcfZWNvjHRGT5peIJTlSnh/Iy4mMpGuGlz1TDoXJO6AzOsKhmuEvh8OJcXrL6+N1QSOW1t5lf150PQkjrEyREJCxGu6bR4f4jPfx51hz5DQsuFpLFjttDkqeIq3D379VGdie29fHgA5GZLiLVb3aScAUJkAFXt1vm5cQ8JH84czsAU= example@example.com"
    }
  }
  tags = {
    source = "opentofu-azapi"
  }
}
