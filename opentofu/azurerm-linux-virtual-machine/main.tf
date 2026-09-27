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


resource "azurerm_virtual_network" "example" {
  name                = "example-vnet-from-opentofu"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
  tags = {
    "source" : "opentofu"
  }
}

resource "azurerm_subnet" "example" {
  name                 = "subnet-1"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic-from-opentofu"
  location            = local.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    "source" : "opentofu"
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                  = "example-vm-from-opentofu"
  location              = local.location
  resource_group_name   = azurerm_resource_group.example.name
  size                  = "Standard_B1s"
  admin_username        = "adminuser"
  network_interface_ids = [azurerm_network_interface.example.id]

  admin_ssh_key {
    username   = "adminuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDbY7RIVj+SLjb8thHachpRwpSGOh9C2dE2mond1hNOD62Z6d+tJzIl28grzZLXAqFzCyleJCBVLFWH86GwBZ5deM4lcSkuEHLuy5uvGvLvHZjPFNPfeLUg8J1FzGk9SBtVdVd/SruP99/ZQVkmxM4n1qAsrPN3Pml6PrfH/qTB+G1RO4CfZnttxntVHO47mEnvy/gWNyDUXuRqJJKdKTjuUiYtoo5hQExpR+IQrlzQDgmDNns7PSstuKQQ8JSbyyPb706hfTDBzdf5xkJToH4n2mHtw1lZIN/b6e4jCdItBeNTJ24QXfivSJ3efLUjRfb4bbKOVsMsuFWB6IEUCTcfZWNvjHRGT5peIJTlSnh/Iy4mMpGuGlz1TDoXJO6AzOsKhmuEvh8OJcXrL6+N1QSOW1t5lf150PQkjrEyREJCxGu6bR4f4jPfx51hz5DQsuFpLFjttDkqeIq3D379VGdie29fHgA5GZLiLVb3aScAUJkAFXt1vm5cQ8JH84czsAU= example@example.com"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  tags = {
    "source" : "opentofu"
  }
}
