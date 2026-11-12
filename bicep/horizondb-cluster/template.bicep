@description('The Azure Region (or Locally Region) to deploy the resources into.')
param location string = resourceGroup().location

resource horizonDbCluster 'Microsoft.HorizonDb/clusters@2026-10-01-preview' = {
  name: 'example-horizondb-from-bicep'
  location: location
  properties: {
    postgreSqlVersion: '18'
    backup: {
      geoRedundancy: 'Disabled'
    }
  }
}

// The administrator credentials are a singleton beneath the Cluster, which
// the Pool's PostgreSQL instance is configured with.
resource passwordAuthentication 'Microsoft.HorizonDb/clusters/authentications@2026-10-01-preview' = {
  parent: horizonDbCluster
  name: 'passwordMethod'
  properties: {
    state: 'Enabled'
    administratorLogin: 'exampleadmin'
    // This is a local emulator example - real deployments should pass the password in
    // from a secret (e.g. a @secure() parameter sourced from Key Vault).
    #disable-next-line use-secure-value-for-secure-inputs
    administratorLoginPassword: 'Example-Passw0rd!'
  }
}

resource horizonDbPool 'Microsoft.HorizonDb/clusters/pools@2026-10-01-preview' = {
  parent: horizonDbCluster
  name: 'example-pool'
  properties: {
    nodeCount: 1
    highAvailability: {
      mode: 'Disabled'
    }
    computeModel: {
      type: 'Provisioned'
      computeGeneration: 1
      computeProcessor: 'Intel'
      vCores: 4
    }
  }
  dependsOn: [
    passwordAuthentication
  ]
}

resource firewallRule 'Microsoft.HorizonDb/clusters/pools/firewallRules@2026-10-01-preview' = {
  parent: horizonDbPool
  name: 'example-firewall-rule'
  properties: {
    description: 'Allows connections from an example IP range.'
    startIpAddress: '203.0.113.0'
    endIpAddress: '203.0.113.255'
  }
}
