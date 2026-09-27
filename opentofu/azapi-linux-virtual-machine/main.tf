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

resource "azapi_resource" "virtual_network" {
  type      = "Microsoft.Network/virtualNetworks@2025-07-01"
  name      = "example-vnet-from-opentofu-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    properties = {
      addressSpace = {
        addressPrefixes = ["10.0.0.0/16"]
      }
    }
  }
  tags = {
    source = "opentofu-azapi"
  }
}

resource "azapi_resource" "subnet" {
  type      = "Microsoft.Network/virtualNetworks/subnets@2025-07-01"
  name      = "subnet-1"
  parent_id = azapi_resource.virtual_network.id
  body = {
    properties = {
      addressPrefix = "10.0.1.0/24"
    }
  }
}

resource "azapi_resource" "network_interface" {
  type      = "Microsoft.Network/networkInterfaces@2025-07-01"
  name      = "example-nic-from-opentofu-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    properties = {
      ipConfigurations = [
        {
          name = "internal"
          properties = {
            privateIPAllocationMethod = "Dynamic"
            subnet = {
              id = azapi_resource.subnet.id
            }
          }
        }
      ]
    }
  }
  tags = {
    source = "opentofu-azapi"
  }
}

resource "azapi_resource" "virtual_machine" {
  type      = "Microsoft.Compute/virtualMachines@2026-03-01"
  name      = "example-vm-from-opentofu-azapi"
  location  = local.location
  parent_id = azapi_resource.resource_group.id
  body = {
    properties = {
      hardwareProfile = {
        vmSize = "Standard_B1s"
      }
      osProfile = {
        computerName  = "example-vm"
        adminUsername = "adminuser"
        linuxConfiguration = {
          disablePasswordAuthentication = true
          ssh = {
            publicKeys = [
              {
                path    = "/home/adminuser/.ssh/authorized_keys"
                keyData = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDbY7RIVj+SLjb8thHachpRwpSGOh9C2dE2mond1hNOD62Z6d+tJzIl28grzZLXAqFzCyleJCBVLFWH86GwBZ5deM4lcSkuEHLuy5uvGvLvHZjPFNPfeLUg8J1FzGk9SBtVdVd/SruP99/ZQVkmxM4n1qAsrPN3Pml6PrfH/qTB+G1RO4CfZnttxntVHO47mEnvy/gWNyDUXuRqJJKdKTjuUiYtoo5hQExpR+IQrlzQDgmDNns7PSstuKQQ8JSbyyPb706hfTDBzdf5xkJToH4n2mHtw1lZIN/b6e4jCdItBeNTJ24QXfivSJ3efLUjRfb4bbKOVsMsuFWB6IEUCTcfZWNvjHRGT5peIJTlSnh/Iy4mMpGuGlz1TDoXJO6AzOsKhmuEvh8OJcXrL6+N1QSOW1t5lf150PQkjrEyREJCxGu6bR4f4jPfx51hz5DQsuFpLFjttDkqeIq3D379VGdie29fHgA5GZLiLVb3aScAUJkAFXt1vm5cQ8JH84czsAU= example@example.com"
              }
            ]
          }
        }
      }
      storageProfile = {
        imageReference = {
          publisher = "Canonical"
          offer     = "ubuntu-24_04-lts"
          sku       = "server"
          version   = "latest"
        }
        osDisk = {
          createOption = "FromImage"
          caching      = "ReadWrite"
          deleteOption = "Delete"
          managedDisk = {
            storageAccountType = "Standard_LRS"
          }
        }
      }
      networkProfile = {
        networkInterfaces = [
          {
            id = azapi_resource.network_interface.id
          }
        ]
      }
    }
  }
  tags = {
    source = "opentofu-azapi"
  }
}
