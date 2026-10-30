resource apiManagement 'Microsoft.ApiManagement/service@2024-05-01' = {
  name: 'example-apim-from-bicep'
  location: 'berlin'
  sku: {
    name: 'Developer'
    capacity: 1
  }
  properties: {
    publisherEmail: 'admin@example.com'
    publisherName: 'Example Publisher'
  }
}

resource api 'Microsoft.ApiManagement/service/apis@2024-05-01' = {
  parent: apiManagement
  name: 'example-api'
  properties: {
    displayName: 'Example API'
    path: 'example'
    protocols: [
      'https'
    ]
    serviceUrl: 'https://httpbin.org'
  }
}

resource operation 'Microsoft.ApiManagement/service/apis/operations@2024-05-01' = {
  parent: api
  name: 'get-status'
  properties: {
    displayName: 'Get Status'
    method: 'GET'
    urlTemplate: '/status/{code}'
    templateParameters: [
      {
        name: 'code'
        type: 'number'
        required: true
      }
    ]
  }
}
