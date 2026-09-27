param adminUsername string = 'adminuser'

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2025-07-01' = {
  name: 'example-vnet-from-bicep'
  location: 'berlin'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
  }
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2025-07-01' = {
  parent: virtualNetwork
  name: 'subnet-1'
  properties: {
    addressPrefix: '10.0.1.0/24'
  }
}

resource networkInterface 'Microsoft.Network/networkInterfaces@2025-07-01' = {
  name: 'example-nic-from-bicep'
  location: 'berlin'
  properties: {
    ipConfigurations: [
      {
        name: 'internal'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: subnet.id
          }
        }
      }
    ]
  }
}

resource virtualMachine 'Microsoft.Compute/virtualMachines@2026-04-01' = {
  name: 'example-vm-from-bicep'
  location: 'berlin'
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B1s'
    }
    osProfile: {
      computerName: 'example-vm'
      adminUsername: adminUsername
      linuxConfiguration: {
        disablePasswordAuthentication: true
        ssh: {
          publicKeys: [
            {
              path: '/home/${adminUsername}/.ssh/authorized_keys'
              keyData: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDbY7RIVj+SLjb8thHachpRwpSGOh9C2dE2mond1hNOD62Z6d+tJzIl28grzZLXAqFzCyleJCBVLFWH86GwBZ5deM4lcSkuEHLuy5uvGvLvHZjPFNPfeLUg8J1FzGk9SBtVdVd/SruP99/ZQVkmxM4n1qAsrPN3Pml6PrfH/qTB+G1RO4CfZnttxntVHO47mEnvy/gWNyDUXuRqJJKdKTjuUiYtoo5hQExpR+IQrlzQDgmDNns7PSstuKQQ8JSbyyPb706hfTDBzdf5xkJToH4n2mHtw1lZIN/b6e4jCdItBeNTJ24QXfivSJ3efLUjRfb4bbKOVsMsuFWB6IEUCTcfZWNvjHRGT5peIJTlSnh/Iy4mMpGuGlz1TDoXJO6AzOsKhmuEvh8OJcXrL6+N1QSOW1t5lf150PQkjrEyREJCxGu6bR4f4jPfx51hz5DQsuFpLFjttDkqeIq3D379VGdie29fHgA5GZLiLVb3aScAUJkAFXt1vm5cQ8JH84czsAU= example@example.com'
            }
          ]
        }
      }
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: 'ubuntu-24_04-lts'
        sku: 'server'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        caching: 'ReadWrite'
        deleteOption: 'Delete'
        managedDisk: {
          storageAccountType: 'Standard_LRS'
        }
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterface.id
        }
      ]
    }
  }
}
