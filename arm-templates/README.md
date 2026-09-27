```
ooooo                                      oooo  oooo              
`888'                                      `888  `888              
 888          .ooooo.   .ooooo.   .oooo.    888   888  oooo    ooo 
 888         d88' `88b d88' `\"Y8 `P  )88b   888   888   `88.  .8'
 888         888   888 888        .oP\"888   888   888    `88..8'
 888       o 888   888 888   .o8 d8(  888   888   888     `888'
o888ooooood8 `Y8bod8P' `Y8bod8P' `Y888\"\"8o o888o o888o     .8'
                                                       .o..P'
                                                       `Y8P'
```

# Examples of how to deploy ARM Templates to Locally

This directory contains examples of how to deploy Azure Resource Manager (ARM) Templates to [Locally](https://locally.build).

## Getting Started

Each directory contains a README with more information about the example, alongside a Azure Resource Manager (ARM) Template.

Each example requires that you have [Locally](https://locally.build) installed.

Find out more about [Locally](https://locally.build) and how to get started in [our guide on deploying ARM Templates to Locally](https://locally.build/docs/guides/deploying-an-arm-template).

## Examples

* [Deploying an Action Group to Locally using an ARM Template](action-group/)
* [Deploying an App Configuration Store to Locally using an ARM Template](app-configuration/)
* [Deploying an App Service Plan to Locally using an ARM Template](app-service-plan/)
* [Deploying an Application Insights Component to Locally using an ARM Template](application-insights/)
* [Deploying an Application Security Group to Locally using an ARM Template](application-security-group/)
* [Deploying an Availability Set to Locally using an ARM Template](availability-set/)
* [Deploying a Container Instance to Locally using an ARM Template](container-instance/)
* [Deploying a Container Registry to Locally using an ARM Template](container-registry/)
* [Deploying a Cosmos DB Account to Locally using an ARM Template](cosmosdb-account/)
* [Deploying a Cosmos DB SQL Container to Locally using an ARM Template](cosmosdb-sql-container/)
* [Deploying a Cosmos DB SQL Database to Locally using an ARM Template](cosmosdb-sql-database/)
* [Deploying a Custom Role Definition to Locally using an ARM Template](role-definition/)
* [Deploying a DDOS Protection Plan to Locally using an ARM Template](ddos-protection-plan/)
* [Deploying a DNS Zone to Locally using an ARM Template](dns-zone/)
* [Deploying an Event Grid Topic to Locally using an ARM Template](eventgrid-topic/)
* [Deploying an Event Hub to Locally using an ARM Template](eventhub/)
* [Deploying an Event Hubs Namespace to Locally using an ARM Template](eventhub-namespace/)
* [Deploying a Function App to Locally using an ARM Template](function-app/)
* [Deploying a Key Vault to Locally using an ARM Template](key-vault/)
* [Deploying a Key Vault Key to Locally using an ARM Template](key-vault-key/)
* [Deploying a Key Vault Secret to Locally using an ARM Template](key-vault-secret/)
* [Deploying a Linux Virtual Machine to Locally using an ARM Template](linux-virtual-machine/)
* [Deploying a Linux Web App to Locally using an ARM Template](linux-web-app/)
* [Deploying a Load Balancer to Locally using an ARM Template](load-balancer/)
* [Deploying a Log Analytics Workspace to Locally using an ARM Template](log-analytics-workspace/)
* [Deploying a Managed Disk to Locally using an ARM Template](managed-disk/)
* [Deploying a Management Lock to Locally using an ARM Template](management-lock/)
* [Deploying a NAT Gateway to Locally using an ARM Template](nat-gateway/)
* [Deploying a Network Interface to Locally using an ARM Template](network-interface/)
* [Deploying a Network Security Group to Locally using an ARM Template](network-security-group/)
* [Deploying a PostgreSQL Flexible Server to Locally using an ARM Template](postgresql-flexible-server/)
* [Deploying a Private DNS Zone with a Virtual Network Link to Locally using an ARM Template](private-dns-zone/)
* [Deploying a Private Endpoint to Locally using an ARM Template](private-endpoint/)
* [Deploying a Proximity Placement Group to Locally using an ARM Template](proximity-placement-group/)
* [Deploying a Public IP Address to Locally using an ARM Template](public-ip-address/)
* [Deploying a Redis Cache to Locally using an ARM Template](redis-cache/)
* [Deploying a Role Assignment to Locally using an ARM Template](role-assignment/)
* [Deploying a Route Table to Locally using an ARM Template](route-table/)
* [Deploying a Service Bus Namespace to Locally using an ARM Template](servicebus-namespace/)
* [Deploying a Service Bus Queue to Locally using an ARM Template](servicebus-queue/)
* [Deploying a Service Bus Topic with a Subscription to Locally using an ARM Template](servicebus-topic/)
* [Deploying an SSH Public Key to Locally using an ARM Template](ssh-public-key/)
* [Deploying a Storage Account to Locally using an ARM Template](storage-account/)
* [Deploying a Storage Blob Container to Locally using an ARM Template](storage-blob-container/)
* [Deploying a Storage File Share to Locally using an ARM Template](storage-file-share/)
* [Deploying a Storage Queue to Locally using an ARM Template](storage-queue/)
* [Deploying a User-Assigned Managed Identity to Locally using an ARM Template](user-assigned-identity/)
* [Deploying a Virtual Network Peering to Locally using an ARM Template](virtual-network-peering/)
* [Deploying a Virtual Network with Subnets to Locally using an ARM Template](virtual-network/)

### The different types of ARM Template Deployments

It's worth calling out that there are different types of ARM Template Deployments:

- **Resource Group Deployments** which deploy resources within a Resource Group. This is the most common type of deployment.
- **Subscription Deployments** which deploy resources within a Subscription.
- **Management Group Deployments** which deploys resources within a Management Group.

### Deployment Modes

Both deployment modes are supported:

- **Incremental** (the default) - resources in the template are created or updated, and anything else in the Resource Group is left as-is.
- **Complete** - the Resource Group is made to match the template, so any resources not in the template are deleted.

```bash
locally deploy --mode Complete --resource-group example template.json
```

Or, using the Azure CLI:

```bash
locally run az deployment group create --mode Complete --resource-group example --template-file template.json
```

### Limitations

Locally is still a work-in-progress, at this time there's one known limitation when deploying ARM Templates:

- We only support deploying ARM Templates at the **Resource Group** and **Subscription** levels for now (Management Group and Tenant level deployments aren't supported yet).

We intend to remove this limitation in a future release of Locally, but we wanted to call it out for now.
