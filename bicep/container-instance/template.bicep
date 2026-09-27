resource containerGroup 'Microsoft.ContainerInstance/containerGroups@2025-09-01' = {
  name: 'example-containergroup-from-bicep'
  location: 'berlin'
  properties: {
    containers: [
      {
        name: 'hello-world'
        properties: {
          image: 'mcr.microsoft.com/azuredocs/aci-helloworld'
          ports: [
            {
              port: 80
              protocol: 'TCP'
            }
          ]
          resources: {
            requests: {
              cpu: 1
              memoryInGB: json('1.5')
            }
          }
        }
      }
    ]
    osType: 'Linux'
    ipAddress: {
      type: 'Public'
      ports: [
        {
          port: 80
          protocol: 'TCP'
        }
      ]
    }
  }
}
