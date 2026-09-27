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

# Examples of how to use OpenTofu with Locally

This directory contains examples of how to use [OpenTofu](https://opentofu.org) with [Locally](https://locally.build).

## Getting Started

Each directory contains a README with more information about the example, alongside an OpenTofu Configuration.

Each example requires that you have [OpenTofu](https://opentofu.org) and [Locally](https://locally.build) installed.

Find out more about [Locally](https://locally.build) and how to get started in [our guide on using OpenTofu with Locally](https://locally.build/docs/guides/using-locally-with-opentofu).

## Examples

Each resource has equivalent examples for both the `opentofu/azurerm` and `Azure/azapi` providers, so you can compare them side-by-side.

### Examples using the `opentofu/azurerm` provider

* [Deploying an Action Group to Locally using the `opentofu/azurerm` provider](azurerm-action-group/)
* [Deploying an App Configuration Store to Locally using the `opentofu/azurerm` provider](azurerm-app-configuration/)
* [Deploying an App Service Plan to Locally using the `opentofu/azurerm` provider](azurerm-app-service-plan/)
* [Deploying an Application Insights Component to Locally using the `opentofu/azurerm` provider](azurerm-application-insights/)
* [Deploying an Application Security Group to Locally using the `opentofu/azurerm` provider](azurerm-application-security-group/)
* [Deploying an Availability Set to Locally using the `opentofu/azurerm` provider](azurerm-availability-set/)
* [Deploying a Container Instance to Locally using the `opentofu/azurerm` provider](azurerm-container-instance/)
* [Deploying a Container Registry to Locally using the `opentofu/azurerm` provider](azurerm-container-registry/)
* [Deploying a Cosmos DB Account to Locally using the `opentofu/azurerm` provider](azurerm-cosmosdb-account/)
* [Deploying a Cosmos DB SQL Container to Locally using the `opentofu/azurerm` provider](azurerm-cosmosdb-sql-container/)
* [Deploying a Cosmos DB SQL Database to Locally using the `opentofu/azurerm` provider](azurerm-cosmosdb-sql-database/)
* [Deploying a Custom Role Definition to Locally using the `opentofu/azurerm` provider](azurerm-role-definition/)
* [Deploying a DDOS Protection Plan to Locally using the `opentofu/azurerm` provider](azurerm-ddos-protection-plan/)
* [Deploying a DNS Zone to Locally using the `opentofu/azurerm` provider](azurerm-dns-zone/)
* [Deploying an Event Grid Topic to Locally using the `opentofu/azurerm` provider](azurerm-eventgrid-topic/)
* [Deploying an Event Hub to Locally using the `opentofu/azurerm` provider](azurerm-eventhub/)
* [Deploying an Event Hubs Namespace to Locally using the `opentofu/azurerm` provider](azurerm-eventhub-namespace/)
* [Deploying a Function App to Locally using the `opentofu/azurerm` provider](azurerm-function-app/)
* [Deploying a Key Vault to Locally using the `opentofu/azurerm` provider](azurerm-key-vault/)
* [Deploying a Key Vault Key to Locally using the `opentofu/azurerm` provider](azurerm-key-vault-key/)
* [Deploying a Key Vault Secret to Locally using the `opentofu/azurerm` provider](azurerm-key-vault-secret/)
* [Deploying a Linux Virtual Machine to Locally using the `opentofu/azurerm` provider](azurerm-linux-virtual-machine/)
* [Deploying a Linux Web App to Locally using the `opentofu/azurerm` provider](azurerm-linux-web-app/)
* [Deploying a Load Balancer to Locally using the `opentofu/azurerm` provider](azurerm-load-balancer/)
* [Deploying a Log Analytics Workspace to Locally using the `opentofu/azurerm` provider](azurerm-log-analytics-workspace/)
* [Deploying a Managed Disk to Locally using the `opentofu/azurerm` provider](azurerm-managed-disk/)
* [Deploying a Management Lock to Locally using the `opentofu/azurerm` provider](azurerm-management-lock/)
* [Deploying a NAT Gateway to Locally using the `opentofu/azurerm` provider](azurerm-nat-gateway/)
* [Deploying a Network Interface to Locally using the `opentofu/azurerm` provider](azurerm-network-interface/)
* [Deploying a Network Security Group to Locally using the `opentofu/azurerm` provider](azurerm-network-security-group/)
* [Deploying a PostgreSQL Flexible Server to Locally using the `opentofu/azurerm` provider](azurerm-postgresql-flexible-server/)
* [Deploying a Private DNS Zone with a Virtual Network Link to Locally using the `opentofu/azurerm` provider](azurerm-private-dns-zone/)
* [Deploying a Private Endpoint to Locally using the `opentofu/azurerm` provider](azurerm-private-endpoint/)
* [Deploying a Proximity Placement Group to Locally using the `opentofu/azurerm` provider](azurerm-proximity-placement-group/)
* [Deploying a Public IP Address to Locally using the `opentofu/azurerm` provider](azurerm-public-ip-address/)
* [Deploying a Redis Cache to Locally using the `opentofu/azurerm` provider](azurerm-redis-cache/)
* [Deploying a Resource Group to Locally using the `opentofu/azurerm` provider](azurerm-resource-group/)
* [Deploying a Role Assignment to Locally using the `opentofu/azurerm` provider](azurerm-role-assignment/)
* [Deploying a Route Table to Locally using the `opentofu/azurerm` provider](azurerm-route-table/)
* [Deploying a Service Bus Namespace to Locally using the `opentofu/azurerm` provider](azurerm-servicebus-namespace/)
* [Deploying a Service Bus Queue to Locally using the `opentofu/azurerm` provider](azurerm-servicebus-queue/)
* [Deploying a Service Bus Topic with a Subscription to Locally using the `opentofu/azurerm` provider](azurerm-servicebus-topic/)
* [Deploying an SSH Public Key to Locally using the `opentofu/azurerm` provider](azurerm-ssh-public-key/)
* [Deploying a Storage Account to Locally using the `opentofu/azurerm` provider](azurerm-storage-account/)
* [Deploying a Storage Blob Container to Locally using the `opentofu/azurerm` provider](azurerm-storage-blob-container/)
* [Deploying a Storage File Share to Locally using the `opentofu/azurerm` provider](azurerm-storage-file-share/)
* [Deploying a Storage Queue to Locally using the `opentofu/azurerm` provider](azurerm-storage-queue/)
* [Deploying a User-Assigned Managed Identity to Locally using the `opentofu/azurerm` provider](azurerm-user-assigned-identity/)
* [Deploying a Virtual Network Peering to Locally using the `opentofu/azurerm` provider](azurerm-virtual-network-peering/)
* [Deploying a Virtual Network with Subnets to Locally using the `opentofu/azurerm` provider](azurerm-virtual-network/)

### Examples using the `Azure/azapi` provider

* [Deploying an Action Group to Locally using the `Azure/azapi` provider](azapi-action-group/)
* [Deploying an App Configuration Store to Locally using the `Azure/azapi` provider](azapi-app-configuration/)
* [Deploying an App Service Plan to Locally using the `Azure/azapi` provider](azapi-app-service-plan/)
* [Deploying an Application Insights Component to Locally using the `Azure/azapi` provider](azapi-application-insights/)
* [Deploying an Application Security Group to Locally using the `Azure/azapi` provider](azapi-application-security-group/)
* [Deploying an Availability Set to Locally using the `Azure/azapi` provider](azapi-availability-set/)
* [Deploying a Container Instance to Locally using the `Azure/azapi` provider](azapi-container-instance/)
* [Deploying a Container Registry to Locally using the `Azure/azapi` provider](azapi-container-registry/)
* [Deploying a Cosmos DB Account to Locally using the `Azure/azapi` provider](azapi-cosmosdb-account/)
* [Deploying a Cosmos DB SQL Container to Locally using the `Azure/azapi` provider](azapi-cosmosdb-sql-container/)
* [Deploying a Cosmos DB SQL Database to Locally using the `Azure/azapi` provider](azapi-cosmosdb-sql-database/)
* [Deploying a Custom Role Definition to Locally using the `Azure/azapi` provider](azapi-role-definition/)
* [Deploying a DDOS Protection Plan to Locally using the `Azure/azapi` provider](azapi-ddos-protection-plan/)
* [Deploying a DNS Zone to Locally using the `Azure/azapi` provider](azapi-dns-zone/)
* [Deploying an Event Grid Topic to Locally using the `Azure/azapi` provider](azapi-eventgrid-topic/)
* [Deploying an Event Hub to Locally using the `Azure/azapi` provider](azapi-eventhub/)
* [Deploying an Event Hubs Namespace to Locally using the `Azure/azapi` provider](azapi-eventhub-namespace/)
* [Deploying a Function App to Locally using the `Azure/azapi` provider](azapi-function-app/)
* [Deploying a Key Vault to Locally using the `Azure/azapi` provider](azapi-key-vault/)
* [Deploying a Key Vault Key to Locally using the `Azure/azapi` provider](azapi-key-vault-key/)
* [Deploying a Key Vault Secret to Locally using the `Azure/azapi` provider](azapi-key-vault-secret/)
* [Deploying a Linux Virtual Machine to Locally using the `Azure/azapi` provider](azapi-linux-virtual-machine/)
* [Deploying a Linux Web App to Locally using the `Azure/azapi` provider](azapi-linux-web-app/)
* [Deploying a Load Balancer to Locally using the `Azure/azapi` provider](azapi-load-balancer/)
* [Deploying a Log Analytics Workspace to Locally using the `Azure/azapi` provider](azapi-log-analytics-workspace/)
* [Deploying a Managed Disk to Locally using the `Azure/azapi` provider](azapi-managed-disk/)
* [Deploying a Management Lock to Locally using the `Azure/azapi` provider](azapi-management-lock/)
* [Deploying a NAT Gateway to Locally using the `Azure/azapi` provider](azapi-nat-gateway/)
* [Deploying a Network Interface to Locally using the `Azure/azapi` provider](azapi-network-interface/)
* [Deploying a Network Security Group to Locally using the `Azure/azapi` provider](azapi-network-security-group/)
* [Deploying a PostgreSQL Flexible Server to Locally using the `Azure/azapi` provider](azapi-postgresql-flexible-server/)
* [Deploying a Private DNS Zone with a Virtual Network Link to Locally using the `Azure/azapi` provider](azapi-private-dns-zone/)
* [Deploying a Private Endpoint to Locally using the `Azure/azapi` provider](azapi-private-endpoint/)
* [Deploying a Proximity Placement Group to Locally using the `Azure/azapi` provider](azapi-proximity-placement-group/)
* [Deploying a Public IP Address to Locally using the `Azure/azapi` provider](azapi-public-ip-address/)
* [Deploying a Redis Cache to Locally using the `Azure/azapi` provider](azapi-redis-cache/)
* [Deploying a Resource Group to Locally using the `Azure/azapi` provider](azapi-resource-group/)
* [Deploying a Role Assignment to Locally using the `Azure/azapi` provider](azapi-role-assignment/)
* [Deploying a Route Table to Locally using the `Azure/azapi` provider](azapi-route-table/)
* [Deploying a Service Bus Namespace to Locally using the `Azure/azapi` provider](azapi-servicebus-namespace/)
* [Deploying a Service Bus Queue to Locally using the `Azure/azapi` provider](azapi-servicebus-queue/)
* [Deploying a Service Bus Topic with a Subscription to Locally using the `Azure/azapi` provider](azapi-servicebus-topic/)
* [Deploying an SSH Public Key to Locally using the `Azure/azapi` provider](azapi-ssh-public-key/)
* [Deploying a Storage Account to Locally using the `Azure/azapi` provider](azapi-storage-account/)
* [Deploying a Storage Blob Container to Locally using the `Azure/azapi` provider](azapi-storage-blob-container/)
* [Deploying a Storage File Share to Locally using the `Azure/azapi` provider](azapi-storage-file-share/)
* [Deploying a Storage Queue to Locally using the `Azure/azapi` provider](azapi-storage-queue/)
* [Deploying a User-Assigned Managed Identity to Locally using the `Azure/azapi` provider](azapi-user-assigned-identity/)
* [Deploying a Virtual Network Peering to Locally using the `Azure/azapi` provider](azapi-virtual-network-peering/)
* [Deploying a Virtual Network with Subnets to Locally using the `Azure/azapi` provider](azapi-virtual-network/)
