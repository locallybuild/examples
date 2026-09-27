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

## Examples

This repository contains examples of how to use [Locally](https://locally.build) with various tooling.

The examples are grouped by tool below.

### Example Applications

Complete, end-to-end applications (infrastructure and code together), each in its own repository. See [`applications/`](./applications/) for more information.

#### App Service

* [App Configuration-backed app on App Service](https://github.com/locallybuild/example-app-service-app-configuration): An app deployed to App Service that reads its settings from App Configuration.
* [Cosmos DB-backed app on App Service](https://github.com/locallybuild/example-app-service-cosmosdb): A TypeScript app deployed to App Service that writes to Cosmos DB.
* [MySQL-backed app on App Service](https://github.com/locallybuild/example-app-service-mysql): A Python app deployed to App Service that works with MySQL.
* [PostgreSQL-backed app on App Service](https://github.com/locallybuild/example-app-service-postgresql): An app deployed to App Service that writes to PostgreSQL.
* [WordPress on App Service](https://github.com/locallybuild/example-app-service-wordpress): WordPress running on App Service, backed by MySQL.
* [Web Arena Game on App Service](https://github.com/locallybuild/example-app-service-arena-game): A browser-based arena game provisioned to App Service.

#### Container Instances

* [Redis-backed app on Container Instances](https://github.com/locallybuild/example-container-instance-redis): An app running in a Container Instance that reads from and writes to Redis.
* [SAML-powered CRM on Container Instances](https://github.com/locallybuild/example-container-instance-saml): A SAML-based CRM application deployed to a Container Instance.

#### Functions

* [Event Grid triggered Function App](https://github.com/locallybuild/example-eventgrid-triggered-function-app): A Function App triggered by Event Grid whenever resources are provisioned.

#### CI

* [Running Locally in GitHub Actions](https://github.com/locallybuild/example-github-actions): An example of using Locally within a GitHub Actions workflow.

### ARM Templates

See [`arm-templates/`](./arm-templates/) for more information.

* [Deploy an Action Group to Locally using an ARM Template](./arm-templates/action-group/): Provisions an Action Group with a single email receiver, into a Resource Group of your choosing.
* [Deploy an App Configuration Store to Locally using an ARM Template](./arm-templates/app-configuration/): Provisions an App Configuration Store (Free SKU), into a Resource Group of your choosing.
* [Deploy an App Service Plan to Locally using an ARM Template](./arm-templates/app-service-plan/): Provisions a Linux App Service Plan (B1 SKU), into a Resource Group of your choosing.
* [Deploy an Application Insights Component to Locally using an ARM Template](./arm-templates/application-insights/): Provisions a Log Analytics Workspace and a workspace-based Application Insights component, into a Resource Group of your choosing.
* [Deploy an Application Security Group to Locally using an ARM Template](./arm-templates/application-security-group/): Provisions an Application Security Group, into a Resource Group of your choosing.
* [Deploy an Availability Set to Locally using an ARM Template](./arm-templates/availability-set/): Provisions an Availability Set, into a Resource Group of your choosing.
* [Deploy a Container Instance to Locally using an ARM Template](./arm-templates/container-instance/): Provisions a Container Group running the `mcr.microsoft.com/azuredocs/aci-helloworld` image, into a Resource Group of your choosing.
* [Deploy a Container Registry to Locally using an ARM Template](./arm-templates/container-registry/): Provisions a Container Registry (Basic SKU, with the admin user disabled), into a Resource Group of your choosing.
* [Deploy a Cosmos DB Account to Locally using an ARM Template](./arm-templates/cosmosdb-account/): Provisions a Cosmos DB for NoSQL account using Session consistency, into a Resource Group of your choosing.
* [Deploy a Cosmos DB SQL Container to Locally using an ARM Template](./arm-templates/cosmosdb-sql-container/): Provisions a Cosmos DB for NoSQL account, a SQL Database and a Container partitioned on `/id`, into a Resource Group of your choosing.
* [Deploy a Cosmos DB SQL Database to Locally using an ARM Template](./arm-templates/cosmosdb-sql-database/): Provisions a Cosmos DB for NoSQL account and a SQL Database with 400 RU/s of provisioned throughput, into a Resource Group of your choosing.
* [Deploy a DDOS Protection Plan to Locally using an ARM Template](./arm-templates/ddos-protection-plan/): Provisions a DDOS Protection Plan, into a Resource Group of your choosing.
* [Deploy a DNS Zone to Locally using an ARM Template](./arm-templates/dns-zone/): Provisions a public DNS Zone, into a Resource Group of your choosing.
* [Deploy an Event Grid Topic to Locally using an ARM Template](./arm-templates/eventgrid-topic/): Provisions an Event Grid custom Topic, into a Resource Group of your choosing.
* [Deploy an Event Hub to Locally using an ARM Template](./arm-templates/eventhub/): Provisions an Event Hubs Namespace, an Event Hub and a Consumer Group, into a Resource Group of your choosing.
* [Deploy an Event Hubs Namespace to Locally using an ARM Template](./arm-templates/eventhub-namespace/): Provisions an Event Hubs Namespace (Standard SKU), into a Resource Group of your choosing.
* [Deploy a Function App to Locally using an ARM Template](./arm-templates/function-app/): Provisions a Storage Account, a Linux App Service Plan and a Linux Function App, into a Resource Group of your choosing.
* [Deploy a Key Vault to Locally using an ARM Template](./arm-templates/key-vault/): Provisions a Key Vault (Standard SKU), into a Resource Group of your choosing.
* [Deploy a Key Vault Key to Locally using an ARM Template](./arm-templates/key-vault-key/): Provisions a Key Vault and an RSA Key stored within it, into a Resource Group of your choosing.
* [Deploy a Key Vault Secret to Locally using an ARM Template](./arm-templates/key-vault-secret/): Provisions a Key Vault and a Secret stored within it, into a Resource Group of your choosing.
* [Deploy a Linux Virtual Machine to Locally using an ARM Template](./arm-templates/linux-virtual-machine/): Provisions a Virtual Network, a Subnet, a Network Interface and a Linux Virtual Machine using SSH key authentication, into a Resource Group of your choosing.
* [Deploy a Linux Web App to Locally using an ARM Template](./arm-templates/linux-web-app/): Provisions a Linux App Service Plan and a Linux Web App, into a Resource Group of your choosing.
* [Deploy a Load Balancer to Locally using an ARM Template](./arm-templates/load-balancer/): Provisions a Public IP Address and a Standard Load Balancer with a frontend, a backend pool, a health probe and a load balancing rule, into a Resource Group of your choosing.
* [Deploy a Log Analytics Workspace to Locally using an ARM Template](./arm-templates/log-analytics-workspace/): Provisions a Log Analytics Workspace, into a Resource Group of your choosing.
* [Deploy a Managed Disk to Locally using an ARM Template](./arm-templates/managed-disk/): Provisions an empty 32 GB Managed Disk, into a Resource Group of your choosing.
* [Deploy a Management Lock to Locally using an ARM Template](./arm-templates/management-lock/): Provisions a `CanNotDelete` Management Lock on the Resource Group, into a Resource Group of your choosing.
* [Deploy a NAT Gateway to Locally using an ARM Template](./arm-templates/nat-gateway/): Provisions a Public IP Address, a NAT Gateway, and a Virtual Network whose Subnet routes outbound traffic through the NAT Gateway, into a Resource Group of your choosing.
* [Deploy a Network Interface to Locally using an ARM Template](./arm-templates/network-interface/): Provisions a Virtual Network, a Subnet and a Network Interface, into a Resource Group of your choosing.
* [Deploy a Network Security Group to Locally using an ARM Template](./arm-templates/network-security-group/): Provisions a Network Security Group with an inbound rule allowing HTTPS, into a Resource Group of your choosing.
* [Deploy a PostgreSQL Flexible Server to Locally using an ARM Template](./arm-templates/postgresql-flexible-server/): Provisions a PostgreSQL Flexible Server and a Database, into a Resource Group of your choosing.
* [Deploy a Private DNS Zone with a Virtual Network Link to Locally using an ARM Template](./arm-templates/private-dns-zone/): Provisions a Private DNS Zone, a Virtual Network and a Virtual Network Link between them, into a Resource Group of your choosing.
* [Deploy a Private Endpoint to Locally using an ARM Template](./arm-templates/private-endpoint/): Provisions a Virtual Network, a Subnet, a Storage Account and a Private Endpoint connecting the Storage Account's Blob service into the Subnet, into a Resource Group of your choosing.
* [Deploy a Proximity Placement Group to Locally using an ARM Template](./arm-templates/proximity-placement-group/): Provisions a Proximity Placement Group, into a Resource Group of your choosing.
* [Deploy a Public IP Address to Locally using an ARM Template](./arm-templates/public-ip-address/): Provisions a Public IP Address, into a Resource Group of your choosing.
* [Deploy a Redis Cache to Locally using an ARM Template](./arm-templates/redis-cache/): Provisions a Redis Cache (Basic C0), into a Resource Group of your choosing.
* [Deploy a Role Assignment to Locally using an ARM Template](./arm-templates/role-assignment/): Provisions a User-Assigned Managed Identity and a Role Assignment granting it the built-in `Reader` role on the Resource Group, into a Resource Group of your choosing.
* [Deploy a Custom Role Definition to Locally using an ARM Template](./arm-templates/role-definition/): Provisions a Custom Role Definition assignable at the Resource Group, into a Resource Group of your choosing.
* [Deploy a Route Table to Locally using an ARM Template](./arm-templates/route-table/): Provisions a Route Table, into a Resource Group of your choosing.
* [Deploy a Service Bus Namespace to Locally using an ARM Template](./arm-templates/servicebus-namespace/): Provisions a Service Bus Namespace (Standard SKU), into a Resource Group of your choosing.
* [Deploy a Service Bus Queue to Locally using an ARM Template](./arm-templates/servicebus-queue/): Provisions a Service Bus Namespace and a Queue, into a Resource Group of your choosing.
* [Deploy a Service Bus Topic with a Subscription to Locally using an ARM Template](./arm-templates/servicebus-topic/): Provisions a Service Bus Namespace, a Topic and a Subscription to that Topic, into a Resource Group of your choosing.
* [Deploy an SSH Public Key to Locally using an ARM Template](./arm-templates/ssh-public-key/): Provisions an SSH Public Key, into a Resource Group of your choosing.
* [Deploy a Storage Account to Locally using an ARM Template](./arm-templates/storage-account/): Provisions a Storage Account (StorageV2, Standard LRS), into a Resource Group of your choosing.
* [Deploy a Storage Blob Container to Locally using an ARM Template](./arm-templates/storage-blob-container/): Provisions a Storage Account and a private Blob Container, into a Resource Group of your choosing.
* [Deploy a Storage File Share to Locally using an ARM Template](./arm-templates/storage-file-share/): Provisions a Storage Account and a File Share, into a Resource Group of your choosing.
* [Deploy a Storage Queue to Locally using an ARM Template](./arm-templates/storage-queue/): Provisions a Storage Account and a Queue, into a Resource Group of your choosing.
* [Deploy a User-Assigned Managed Identity to Locally using an ARM Template](./arm-templates/user-assigned-identity/): Provisions a User-Assigned Managed Identity, into a Resource Group of your choosing.
* [Deploy a Virtual Network with Subnets to Locally using an ARM Template](./arm-templates/virtual-network/): Provisions a Virtual Network with two Subnets, into a Resource Group of your choosing.
* [Deploy a Virtual Network Peering to Locally using an ARM Template](./arm-templates/virtual-network-peering/): Provisions two Virtual Networks, peered with each other in both directions, into a Resource Group of your choosing.

### Azure CLI

See [`azure-cli/`](./azure-cli/) for more information.

* [Creating a Resource Group in Locally using the Azure CLI](./azure-cli/#example-creating-a-resource-group-in-locally-using-the-azure-cli): Creates a Resource Group using `az group create`.
* [Creating an Availability Set in Locally using the Azure CLI](./azure-cli/#example-creating-an-availability-set-in-locally-using-the-azure-cli): Creates an Availability Set using `az vm availability-set create`.

### Azure SDK for .NET

See [`azure-sdk-for-dotnet/`](./azure-sdk-for-dotnet/) for more information.

* [Deploy a Container Instance to Locally using the Azure SDK for .NET](./azure-sdk-for-dotnet/container-instance/): Provisions a Resource Group containing a Container Group running the `mcr.microsoft.com/azuredocs/aci-helloworld` image.
* [Deploy a Resource Group to Locally using the Azure SDK for .NET](./azure-sdk-for-dotnet/resource-group/): Provisions a single Resource Group.
* [Send and receive Service Bus messages on Locally using the Azure SDK for .NET](./azure-sdk-for-dotnet/servicebus/): Shows how to send and receive messages through a Service Bus Queue.
* [Deploy a Virtual Network with Subnets to Locally using the Azure SDK for .NET](./azure-sdk-for-dotnet/virtual-network/): Provisions a Resource Group containing a Virtual Network with two Subnets.

### Azure SDK for Go

See [`azure-sdk-for-go/`](./azure-sdk-for-go/) for more information.

* [Deploy a Container Instance to Locally using the Azure SDK for Go](./azure-sdk-for-go/container-instance/): Provisions a Resource Group containing a Container Group running the `mcr.microsoft.com/azuredocs/aci-helloworld` image.
* [Deploy a Resource Group to Locally using the Azure SDK for Go](./azure-sdk-for-go/resource-group/): Provisions a single Resource Group.
* [Send and receive Service Bus messages on Locally using the Azure SDK for Go](./azure-sdk-for-go/servicebus/): Shows how to send and receive messages through a Service Bus Queue.
* [Deploy a Virtual Network with Subnets to Locally using the Azure SDK for Go](./azure-sdk-for-go/virtual-network/): Provisions a Resource Group containing a Virtual Network with two Subnets.

### Bicep

See [`bicep/`](./bicep/) for more information.

* [Deploy an Action Group to Locally using a Bicep Template](./bicep/action-group/): Provisions an Action Group with a single email receiver, into a Resource Group of your choosing.
* [Deploy an App Configuration Store to Locally using a Bicep Template](./bicep/app-configuration/): Provisions an App Configuration Store (Free SKU), into a Resource Group of your choosing.
* [Deploy an App Service Plan to Locally using a Bicep Template](./bicep/app-service-plan/): Provisions a Linux App Service Plan (B1 SKU), into a Resource Group of your choosing.
* [Deploy an Application Insights Component to Locally using a Bicep Template](./bicep/application-insights/): Provisions a Log Analytics Workspace and a workspace-based Application Insights component, into a Resource Group of your choosing.
* [Deploy an Application Security Group to Locally using a Bicep Template](./bicep/application-security-group/): Provisions an Application Security Group, into a Resource Group of your choosing.
* [Deploy an Availability Set to Locally using a Bicep Template](./bicep/availability-set/): Provisions an Availability Set, into a Resource Group of your choosing.
* [Deploy a Container Instance to Locally using a Bicep Template](./bicep/container-instance/): Provisions a Container Group running the `mcr.microsoft.com/azuredocs/aci-helloworld` image, into a Resource Group of your choosing.
* [Deploy a Container Registry to Locally using a Bicep Template](./bicep/container-registry/): Provisions a Container Registry (Basic SKU, with the admin user disabled), into a Resource Group of your choosing.
* [Deploy a Cosmos DB Account to Locally using a Bicep Template](./bicep/cosmosdb-account/): Provisions a Cosmos DB for NoSQL account using Session consistency, into a Resource Group of your choosing.
* [Deploy a Cosmos DB SQL Container to Locally using a Bicep Template](./bicep/cosmosdb-sql-container/): Provisions a Cosmos DB for NoSQL account, a SQL Database and a Container partitioned on `/id`, into a Resource Group of your choosing.
* [Deploy a Cosmos DB SQL Database to Locally using a Bicep Template](./bicep/cosmosdb-sql-database/): Provisions a Cosmos DB for NoSQL account and a SQL Database with 400 RU/s of provisioned throughput, into a Resource Group of your choosing.
* [Deploy a DDOS Protection Plan to Locally using a Bicep Template](./bicep/ddos-protection-plan/): Provisions a DDOS Protection Plan, into a Resource Group of your choosing.
* [Deploy a DNS Zone to Locally using a Bicep Template](./bicep/dns-zone/): Provisions a public DNS Zone, into a Resource Group of your choosing.
* [Deploy an Event Grid Topic to Locally using a Bicep Template](./bicep/eventgrid-topic/): Provisions an Event Grid custom Topic, into a Resource Group of your choosing.
* [Deploy an Event Hub to Locally using a Bicep Template](./bicep/eventhub/): Provisions an Event Hubs Namespace, an Event Hub and a Consumer Group, into a Resource Group of your choosing.
* [Deploy an Event Hubs Namespace to Locally using a Bicep Template](./bicep/eventhub-namespace/): Provisions an Event Hubs Namespace (Standard SKU), into a Resource Group of your choosing.
* [Deploy a Function App to Locally using a Bicep Template](./bicep/function-app/): Provisions a Storage Account, a Linux App Service Plan and a Linux Function App, into a Resource Group of your choosing.
* [Deploy a Key Vault to Locally using a Bicep Template](./bicep/key-vault/): Provisions a Key Vault (Standard SKU), into a Resource Group of your choosing.
* [Deploy a Key Vault Key to Locally using a Bicep Template](./bicep/key-vault-key/): Provisions a Key Vault and an RSA Key stored within it, into a Resource Group of your choosing.
* [Deploy a Key Vault Secret to Locally using a Bicep Template](./bicep/key-vault-secret/): Provisions a Key Vault and a Secret stored within it, into a Resource Group of your choosing.
* [Deploy a Linux Virtual Machine to Locally using a Bicep Template](./bicep/linux-virtual-machine/): Provisions a Virtual Network, a Subnet, a Network Interface and a Linux Virtual Machine using SSH key authentication, into a Resource Group of your choosing.
* [Deploy a Linux Web App to Locally using a Bicep Template](./bicep/linux-web-app/): Provisions a Linux App Service Plan and a Linux Web App, into a Resource Group of your choosing.
* [Deploy a Load Balancer to Locally using a Bicep Template](./bicep/load-balancer/): Provisions a Public IP Address and a Standard Load Balancer with a frontend, a backend pool, a health probe and a load balancing rule, into a Resource Group of your choosing.
* [Deploy a Log Analytics Workspace to Locally using a Bicep Template](./bicep/log-analytics-workspace/): Provisions a Log Analytics Workspace, into a Resource Group of your choosing.
* [Deploy a Managed Disk to Locally using a Bicep Template](./bicep/managed-disk/): Provisions an empty 32 GB Managed Disk, into a Resource Group of your choosing.
* [Deploy a Management Lock to Locally using a Bicep Template](./bicep/management-lock/): Provisions a `CanNotDelete` Management Lock on the Resource Group, into a Resource Group of your choosing.
* [Deploy a NAT Gateway to Locally using a Bicep Template](./bicep/nat-gateway/): Provisions a Public IP Address, a NAT Gateway, and a Virtual Network whose Subnet routes outbound traffic through the NAT Gateway, into a Resource Group of your choosing.
* [Deploy a Network Interface to Locally using a Bicep Template](./bicep/network-interface/): Provisions a Virtual Network, a Subnet and a Network Interface, into a Resource Group of your choosing.
* [Deploy a Network Security Group to Locally using a Bicep Template](./bicep/network-security-group/): Provisions a Network Security Group with an inbound rule allowing HTTPS, into a Resource Group of your choosing.
* [Deploy a PostgreSQL Flexible Server to Locally using a Bicep Template](./bicep/postgresql-flexible-server/): Provisions a PostgreSQL Flexible Server and a Database, into a Resource Group of your choosing.
* [Deploy a Private DNS Zone with a Virtual Network Link to Locally using a Bicep Template](./bicep/private-dns-zone/): Provisions a Private DNS Zone, a Virtual Network and a Virtual Network Link between them, into a Resource Group of your choosing.
* [Deploy a Private Endpoint to Locally using a Bicep Template](./bicep/private-endpoint/): Provisions a Virtual Network, a Subnet, a Storage Account and a Private Endpoint connecting the Storage Account's Blob service into the Subnet, into a Resource Group of your choosing.
* [Deploy a Proximity Placement Group to Locally using a Bicep Template](./bicep/proximity-placement-group/): Provisions a Proximity Placement Group, into a Resource Group of your choosing.
* [Deploy a Public IP Address to Locally using a Bicep Template](./bicep/public-ip-address/): Provisions a Public IP Address, into a Resource Group of your choosing.
* [Deploy a Redis Cache to Locally using a Bicep Template](./bicep/redis-cache/): Provisions a Redis Cache (Basic C0), into a Resource Group of your choosing.
* [Deploy a Role Assignment to Locally using a Bicep Template](./bicep/role-assignment/): Provisions a User-Assigned Managed Identity and a Role Assignment granting it the built-in `Reader` role on the Resource Group, into a Resource Group of your choosing.
* [Deploy a Custom Role Definition to Locally using a Bicep Template](./bicep/role-definition/): Provisions a Custom Role Definition assignable at the Resource Group, into a Resource Group of your choosing.
* [Deploy a Route Table to Locally using a Bicep Template](./bicep/route-table/): Provisions a Route Table, into a Resource Group of your choosing.
* [Deploy a Service Bus Namespace to Locally using a Bicep Template](./bicep/servicebus-namespace/): Provisions a Service Bus Namespace (Standard SKU), into a Resource Group of your choosing.
* [Deploy a Service Bus Queue to Locally using a Bicep Template](./bicep/servicebus-queue/): Provisions a Service Bus Namespace and a Queue, into a Resource Group of your choosing.
* [Deploy a Service Bus Topic with a Subscription to Locally using a Bicep Template](./bicep/servicebus-topic/): Provisions a Service Bus Namespace, a Topic and a Subscription to that Topic, into a Resource Group of your choosing.
* [Deploy an SSH Public Key to Locally using a Bicep Template](./bicep/ssh-public-key/): Provisions an SSH Public Key, into a Resource Group of your choosing.
* [Deploy a Storage Account to Locally using a Bicep Template](./bicep/storage-account/): Provisions a Storage Account (StorageV2, Standard LRS), into a Resource Group of your choosing.
* [Deploy a Storage Blob Container to Locally using a Bicep Template](./bicep/storage-blob-container/): Provisions a Storage Account and a private Blob Container, into a Resource Group of your choosing.
* [Deploy a Storage File Share to Locally using a Bicep Template](./bicep/storage-file-share/): Provisions a Storage Account and a File Share, into a Resource Group of your choosing.
* [Deploy a Storage Queue to Locally using a Bicep Template](./bicep/storage-queue/): Provisions a Storage Account and a Queue, into a Resource Group of your choosing.
* [Deploy a User-Assigned Managed Identity to Locally using a Bicep Template](./bicep/user-assigned-identity/): Provisions a User-Assigned Managed Identity, into a Resource Group of your choosing.
* [Deploy a Virtual Network with Subnets to Locally using a Bicep Template](./bicep/virtual-network/): Provisions a Virtual Network with two Subnets, into a Resource Group of your choosing.
* [Deploy a Virtual Network Peering to Locally using a Bicep Template](./bicep/virtual-network-peering/): Provisions two Virtual Networks, peered with each other in both directions, into a Resource Group of your choosing.

### HashiCorp Terraform

See [`hashicorp-terraform/`](./hashicorp-terraform/) for more information.

* [Deploy an Action Group to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-action-group/): Provisions a Resource Group containing an Action Group with a single email receiver.
* [Deploy an App Configuration Store to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-app-configuration/): Provisions a Resource Group containing an App Configuration Store (Free SKU).
* [Deploy an App Service Plan to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-app-service-plan/): Provisions a Resource Group containing a Linux App Service Plan (B1 SKU).
* [Deploy an Application Insights Component to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-application-insights/): Provisions a Resource Group containing a Log Analytics Workspace and a workspace-based Application Insights component.
* [Deploy an Application Security Group to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-application-security-group/): Provisions a Resource Group containing an Application Security Group.
* [Deploy an Availability Set to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-availability-set/): Provisions a Resource Group containing an Availability Set.
* [Deploy a Container Instance to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-container-instance/): Provisions a Resource Group containing a Container Group running the `mcr.microsoft.com/azuredocs/aci-helloworld` image.
* [Deploy a Container Registry to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-container-registry/): Provisions a Resource Group containing a Container Registry (Basic SKU, with the admin user disabled).
* [Deploy a Cosmos DB Account to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-cosmosdb-account/): Provisions a Resource Group containing a Cosmos DB for NoSQL account using Session consistency.
* [Deploy a Cosmos DB SQL Container to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-cosmosdb-sql-container/): Provisions a Resource Group containing a Cosmos DB for NoSQL account, a SQL Database and a Container partitioned on `/id`.
* [Deploy a Cosmos DB SQL Database to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-cosmosdb-sql-database/): Provisions a Resource Group containing a Cosmos DB for NoSQL account and a SQL Database with 400 RU/s of provisioned throughput.
* [Deploy a DDOS Protection Plan to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-ddos-protection-plan/): Provisions a Resource Group containing a DDOS Protection Plan.
* [Deploy a DNS Zone to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-dns-zone/): Provisions a Resource Group containing a public DNS Zone.
* [Deploy an Event Grid Topic to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-eventgrid-topic/): Provisions a Resource Group containing an Event Grid custom Topic.
* [Deploy an Event Hub to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-eventhub/): Provisions a Resource Group containing an Event Hubs Namespace, an Event Hub and a Consumer Group.
* [Deploy an Event Hubs Namespace to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-eventhub-namespace/): Provisions a Resource Group containing an Event Hubs Namespace (Standard SKU).
* [Deploy a Function App to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-function-app/): Provisions a Resource Group containing a Storage Account, a Linux App Service Plan and a Linux Function App.
* [Deploy a Key Vault to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-key-vault/): Provisions a Resource Group containing a Key Vault (Standard SKU).
* [Deploy a Key Vault Key to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-key-vault-key/): Provisions a Resource Group containing a Key Vault and an RSA Key stored within it.
* [Deploy a Key Vault Secret to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-key-vault-secret/): Provisions a Resource Group containing a Key Vault and a Secret stored within it.
* [Deploy a Linux Virtual Machine to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-linux-virtual-machine/): Provisions a Resource Group containing a Virtual Network, a Subnet, a Network Interface and a Linux Virtual Machine using SSH key authentication.
* [Deploy a Linux Web App to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-linux-web-app/): Provisions a Resource Group containing a Linux App Service Plan and a Linux Web App.
* [Deploy a Load Balancer to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-load-balancer/): Provisions a Resource Group containing a Public IP Address and a Standard Load Balancer with a frontend, a backend pool, a health probe and a load balancing rule.
* [Deploy a Log Analytics Workspace to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-log-analytics-workspace/): Provisions a Resource Group containing a Log Analytics Workspace.
* [Deploy a Managed Disk to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-managed-disk/): Provisions a Resource Group containing an empty 32 GB Managed Disk.
* [Deploy a Management Lock to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-management-lock/): Provisions a Resource Group containing a `CanNotDelete` Management Lock on the Resource Group.
* [Deploy a NAT Gateway to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-nat-gateway/): Provisions a Resource Group containing a Public IP Address, a NAT Gateway, and a Virtual Network whose Subnet routes outbound traffic through the NAT Gateway.
* [Deploy a Network Interface to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-network-interface/): Provisions a Resource Group containing a Virtual Network, a Subnet and a Network Interface.
* [Deploy a Network Security Group to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-network-security-group/): Provisions a Resource Group containing a Network Security Group with an inbound rule allowing HTTPS.
* [Deploy a PostgreSQL Flexible Server to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-postgresql-flexible-server/): Provisions a Resource Group containing a PostgreSQL Flexible Server and a Database.
* [Deploy a Private DNS Zone with a Virtual Network Link to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-private-dns-zone/): Provisions a Resource Group containing a Private DNS Zone, a Virtual Network and a Virtual Network Link between them.
* [Deploy a Private Endpoint to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-private-endpoint/): Provisions a Resource Group containing a Virtual Network, a Subnet, a Storage Account and a Private Endpoint connecting the Storage Account's Blob service into the Subnet.
* [Deploy a Proximity Placement Group to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-proximity-placement-group/): Provisions a Resource Group containing a Proximity Placement Group.
* [Deploy a Public IP Address to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-public-ip-address/): Provisions a Resource Group containing a Public IP Address.
* [Deploy a Redis Cache to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-redis-cache/): Provisions a Resource Group containing a Redis Cache (Basic C0).
* [Deploy a Resource Group to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-resource-group/): Provisions a single Resource Group.
* [Deploy a Role Assignment to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-role-assignment/): Provisions a Resource Group containing a User-Assigned Managed Identity and a Role Assignment granting it the built-in `Reader` role on the Resource Group.
* [Deploy a Custom Role Definition to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-role-definition/): Provisions a Resource Group containing a Custom Role Definition assignable at the Resource Group.
* [Deploy a Route Table to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-route-table/): Provisions a Resource Group containing a Route Table.
* [Deploy a Service Bus Namespace to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-servicebus-namespace/): Provisions a Resource Group containing a Service Bus Namespace (Standard SKU).
* [Deploy a Service Bus Queue to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-servicebus-queue/): Provisions a Resource Group containing a Service Bus Namespace and a Queue.
* [Deploy a Service Bus Topic with a Subscription to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-servicebus-topic/): Provisions a Resource Group containing a Service Bus Namespace, a Topic and a Subscription to that Topic.
* [Deploy an SSH Public Key to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-ssh-public-key/): Provisions a Resource Group containing an SSH Public Key.
* [Deploy a Storage Account to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-storage-account/): Provisions a Resource Group containing a Storage Account (StorageV2, Standard LRS).
* [Deploy a Storage Blob Container to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-storage-blob-container/): Provisions a Resource Group containing a Storage Account and a private Blob Container.
* [Deploy a Storage File Share to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-storage-file-share/): Provisions a Resource Group containing a Storage Account and a File Share.
* [Deploy a Storage Queue to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-storage-queue/): Provisions a Resource Group containing a Storage Account and a Queue.
* [Deploy a User-Assigned Managed Identity to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-user-assigned-identity/): Provisions a Resource Group containing a User-Assigned Managed Identity.
* [Deploy a Virtual Network with Subnets to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-virtual-network/): Provisions a Resource Group containing a Virtual Network with two Subnets.
* [Deploy a Virtual Network Peering to Locally using Terraform and the `Azure/azapi` provider](./hashicorp-terraform/azapi-virtual-network-peering/): Provisions a Resource Group containing two Virtual Networks, peered with each other in both directions.
* [Deploy an Action Group to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-action-group/): Provisions a Resource Group containing an Action Group with a single email receiver.
* [Deploy an App Configuration Store to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-app-configuration/): Provisions a Resource Group containing an App Configuration Store (Free SKU).
* [Deploy an App Service Plan to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-app-service-plan/): Provisions a Resource Group containing a Linux App Service Plan (B1 SKU).
* [Deploy an Application Insights Component to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-application-insights/): Provisions a Resource Group containing a Log Analytics Workspace and a workspace-based Application Insights component.
* [Deploy an Application Security Group to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-application-security-group/): Provisions a Resource Group containing an Application Security Group.
* [Deploy an Availability Set to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-availability-set/): Provisions a Resource Group containing an Availability Set.
* [Deploy a Container Instance to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-container-instance/): Provisions a Resource Group containing a Container Group running the `mcr.microsoft.com/azuredocs/aci-helloworld` image.
* [Deploy a Container Registry to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-container-registry/): Provisions a Resource Group containing a Container Registry (Basic SKU, with the admin user disabled).
* [Deploy a Cosmos DB Account to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-cosmosdb-account/): Provisions a Resource Group containing a Cosmos DB for NoSQL account using Session consistency.
* [Deploy a Cosmos DB SQL Container to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-cosmosdb-sql-container/): Provisions a Resource Group containing a Cosmos DB for NoSQL account, a SQL Database and a Container partitioned on `/id`.
* [Deploy a Cosmos DB SQL Database to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-cosmosdb-sql-database/): Provisions a Resource Group containing a Cosmos DB for NoSQL account and a SQL Database with 400 RU/s of provisioned throughput.
* [Deploy a DDOS Protection Plan to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-ddos-protection-plan/): Provisions a Resource Group containing a DDOS Protection Plan.
* [Deploy a DNS Zone to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-dns-zone/): Provisions a Resource Group containing a public DNS Zone.
* [Deploy an Event Grid Topic to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-eventgrid-topic/): Provisions a Resource Group containing an Event Grid custom Topic.
* [Deploy an Event Hub to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-eventhub/): Provisions a Resource Group containing an Event Hubs Namespace, an Event Hub and a Consumer Group.
* [Deploy an Event Hubs Namespace to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-eventhub-namespace/): Provisions a Resource Group containing an Event Hubs Namespace (Standard SKU).
* [Deploy a Function App to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-function-app/): Provisions a Resource Group containing a Storage Account, a Linux App Service Plan and a Linux Function App.
* [Deploy a Key Vault to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-key-vault/): Provisions a Resource Group containing a Key Vault (Standard SKU).
* [Deploy a Key Vault Key to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-key-vault-key/): Provisions a Resource Group containing a Key Vault and an RSA Key stored within it.
* [Deploy a Key Vault Secret to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-key-vault-secret/): Provisions a Resource Group containing a Key Vault and a Secret stored within it.
* [Deploy a Linux Virtual Machine to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-linux-virtual-machine/): Provisions a Resource Group containing a Virtual Network, a Subnet, a Network Interface and a Linux Virtual Machine using SSH key authentication.
* [Deploy a Linux Web App to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-linux-web-app/): Provisions a Resource Group containing a Linux App Service Plan and a Linux Web App.
* [Deploy a Load Balancer to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-load-balancer/): Provisions a Resource Group containing a Public IP Address and a Standard Load Balancer with a frontend, a backend pool, a health probe and a load balancing rule.
* [Deploy a Log Analytics Workspace to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-log-analytics-workspace/): Provisions a Resource Group containing a Log Analytics Workspace.
* [Deploy a Managed Disk to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-managed-disk/): Provisions a Resource Group containing an empty 32 GB Managed Disk.
* [Deploy a Management Lock to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-management-lock/): Provisions a Resource Group containing a `CanNotDelete` Management Lock on the Resource Group.
* [Deploy a NAT Gateway to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-nat-gateway/): Provisions a Resource Group containing a Public IP Address, a NAT Gateway, and a Virtual Network whose Subnet routes outbound traffic through the NAT Gateway.
* [Deploy a Network Interface to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-network-interface/): Provisions a Resource Group containing a Virtual Network, a Subnet and a Network Interface.
* [Deploy a Network Security Group to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-network-security-group/): Provisions a Resource Group containing a Network Security Group with an inbound rule allowing HTTPS.
* [Deploy a PostgreSQL Flexible Server to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-postgresql-flexible-server/): Provisions a Resource Group containing a PostgreSQL Flexible Server and a Database.
* [Deploy a Private DNS Zone with a Virtual Network Link to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-private-dns-zone/): Provisions a Resource Group containing a Private DNS Zone, a Virtual Network and a Virtual Network Link between them.
* [Deploy a Private Endpoint to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-private-endpoint/): Provisions a Resource Group containing a Virtual Network, a Subnet, a Storage Account and a Private Endpoint connecting the Storage Account's Blob service into the Subnet.
* [Deploy a Proximity Placement Group to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-proximity-placement-group/): Provisions a Resource Group containing a Proximity Placement Group.
* [Deploy a Public IP Address to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-public-ip-address/): Provisions a Resource Group containing a Public IP Address.
* [Deploy a Redis Cache to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-redis-cache/): Provisions a Resource Group containing a Redis Cache (Basic C0).
* [Deploy a Resource Group to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-resource-group/): Provisions a single Resource Group.
* [Deploy a Role Assignment to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-role-assignment/): Provisions a Resource Group containing a User-Assigned Managed Identity and a Role Assignment granting it the built-in `Reader` role on the Resource Group.
* [Deploy a Custom Role Definition to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-role-definition/): Provisions a Resource Group containing a Custom Role Definition assignable at the Resource Group.
* [Deploy a Route Table to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-route-table/): Provisions a Resource Group containing a Route Table.
* [Deploy a Service Bus Namespace to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-servicebus-namespace/): Provisions a Resource Group containing a Service Bus Namespace (Standard SKU).
* [Deploy a Service Bus Queue to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-servicebus-queue/): Provisions a Resource Group containing a Service Bus Namespace and a Queue.
* [Deploy a Service Bus Topic with a Subscription to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-servicebus-topic/): Provisions a Resource Group containing a Service Bus Namespace, a Topic and a Subscription to that Topic.
* [Deploy an SSH Public Key to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-ssh-public-key/): Provisions a Resource Group containing an SSH Public Key.
* [Deploy a Storage Account to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-storage-account/): Provisions a Resource Group containing a Storage Account (StorageV2, Standard LRS).
* [Deploy a Storage Blob Container to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-storage-blob-container/): Provisions a Resource Group containing a Storage Account and a private Blob Container.
* [Deploy a Storage File Share to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-storage-file-share/): Provisions a Resource Group containing a Storage Account and a File Share.
* [Deploy a Storage Queue to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-storage-queue/): Provisions a Resource Group containing a Storage Account and a Queue.
* [Deploy a User-Assigned Managed Identity to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-user-assigned-identity/): Provisions a Resource Group containing a User-Assigned Managed Identity.
* [Deploy a Virtual Network with Subnets to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-virtual-network/): Provisions a Resource Group containing a Virtual Network with two Subnets.
* [Deploy a Virtual Network Peering to Locally using Terraform and the `hashicorp/azurerm` provider](./hashicorp-terraform/azurerm-virtual-network-peering/): Provisions a Resource Group containing two Virtual Networks, peered with each other in both directions.

### OpenTofu

See [`opentofu/`](./opentofu/) for more information.

* [Deploy an Action Group to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-action-group/): Provisions a Resource Group containing an Action Group with a single email receiver.
* [Deploy an App Configuration Store to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-app-configuration/): Provisions a Resource Group containing an App Configuration Store (Free SKU).
* [Deploy an App Service Plan to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-app-service-plan/): Provisions a Resource Group containing a Linux App Service Plan (B1 SKU).
* [Deploy an Application Insights Component to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-application-insights/): Provisions a Resource Group containing a Log Analytics Workspace and a workspace-based Application Insights component.
* [Deploy an Application Security Group to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-application-security-group/): Provisions a Resource Group containing an Application Security Group.
* [Deploy an Availability Set to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-availability-set/): Provisions a Resource Group containing an Availability Set.
* [Deploy a Container Instance to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-container-instance/): Provisions a Resource Group containing a Container Group running the `mcr.microsoft.com/azuredocs/aci-helloworld` image.
* [Deploy a Container Registry to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-container-registry/): Provisions a Resource Group containing a Container Registry (Basic SKU, with the admin user disabled).
* [Deploy a Cosmos DB Account to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-cosmosdb-account/): Provisions a Resource Group containing a Cosmos DB for NoSQL account using Session consistency.
* [Deploy a Cosmos DB SQL Container to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-cosmosdb-sql-container/): Provisions a Resource Group containing a Cosmos DB for NoSQL account, a SQL Database and a Container partitioned on `/id`.
* [Deploy a Cosmos DB SQL Database to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-cosmosdb-sql-database/): Provisions a Resource Group containing a Cosmos DB for NoSQL account and a SQL Database with 400 RU/s of provisioned throughput.
* [Deploy a DDOS Protection Plan to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-ddos-protection-plan/): Provisions a Resource Group containing a DDOS Protection Plan.
* [Deploy a DNS Zone to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-dns-zone/): Provisions a Resource Group containing a public DNS Zone.
* [Deploy an Event Grid Topic to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-eventgrid-topic/): Provisions a Resource Group containing an Event Grid custom Topic.
* [Deploy an Event Hub to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-eventhub/): Provisions a Resource Group containing an Event Hubs Namespace, an Event Hub and a Consumer Group.
* [Deploy an Event Hubs Namespace to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-eventhub-namespace/): Provisions a Resource Group containing an Event Hubs Namespace (Standard SKU).
* [Deploy a Function App to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-function-app/): Provisions a Resource Group containing a Storage Account, a Linux App Service Plan and a Linux Function App.
* [Deploy a Key Vault to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-key-vault/): Provisions a Resource Group containing a Key Vault (Standard SKU).
* [Deploy a Key Vault Key to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-key-vault-key/): Provisions a Resource Group containing a Key Vault and an RSA Key stored within it.
* [Deploy a Key Vault Secret to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-key-vault-secret/): Provisions a Resource Group containing a Key Vault and a Secret stored within it.
* [Deploy a Linux Virtual Machine to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-linux-virtual-machine/): Provisions a Resource Group containing a Virtual Network, a Subnet, a Network Interface and a Linux Virtual Machine using SSH key authentication.
* [Deploy a Linux Web App to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-linux-web-app/): Provisions a Resource Group containing a Linux App Service Plan and a Linux Web App.
* [Deploy a Load Balancer to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-load-balancer/): Provisions a Resource Group containing a Public IP Address and a Standard Load Balancer with a frontend, a backend pool, a health probe and a load balancing rule.
* [Deploy a Log Analytics Workspace to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-log-analytics-workspace/): Provisions a Resource Group containing a Log Analytics Workspace.
* [Deploy a Managed Disk to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-managed-disk/): Provisions a Resource Group containing an empty 32 GB Managed Disk.
* [Deploy a Management Lock to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-management-lock/): Provisions a Resource Group containing a `CanNotDelete` Management Lock on the Resource Group.
* [Deploy a NAT Gateway to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-nat-gateway/): Provisions a Resource Group containing a Public IP Address, a NAT Gateway, and a Virtual Network whose Subnet routes outbound traffic through the NAT Gateway.
* [Deploy a Network Interface to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-network-interface/): Provisions a Resource Group containing a Virtual Network, a Subnet and a Network Interface.
* [Deploy a Network Security Group to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-network-security-group/): Provisions a Resource Group containing a Network Security Group with an inbound rule allowing HTTPS.
* [Deploy a PostgreSQL Flexible Server to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-postgresql-flexible-server/): Provisions a Resource Group containing a PostgreSQL Flexible Server and a Database.
* [Deploy a Private DNS Zone with a Virtual Network Link to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-private-dns-zone/): Provisions a Resource Group containing a Private DNS Zone, a Virtual Network and a Virtual Network Link between them.
* [Deploy a Private Endpoint to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-private-endpoint/): Provisions a Resource Group containing a Virtual Network, a Subnet, a Storage Account and a Private Endpoint connecting the Storage Account's Blob service into the Subnet.
* [Deploy a Proximity Placement Group to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-proximity-placement-group/): Provisions a Resource Group containing a Proximity Placement Group.
* [Deploy a Public IP Address to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-public-ip-address/): Provisions a Resource Group containing a Public IP Address.
* [Deploy a Redis Cache to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-redis-cache/): Provisions a Resource Group containing a Redis Cache (Basic C0).
* [Deploy a Resource Group to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-resource-group/): Provisions a single Resource Group.
* [Deploy a Role Assignment to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-role-assignment/): Provisions a Resource Group containing a User-Assigned Managed Identity and a Role Assignment granting it the built-in `Reader` role on the Resource Group.
* [Deploy a Custom Role Definition to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-role-definition/): Provisions a Resource Group containing a Custom Role Definition assignable at the Resource Group.
* [Deploy a Route Table to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-route-table/): Provisions a Resource Group containing a Route Table.
* [Deploy a Service Bus Namespace to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-servicebus-namespace/): Provisions a Resource Group containing a Service Bus Namespace (Standard SKU).
* [Deploy a Service Bus Queue to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-servicebus-queue/): Provisions a Resource Group containing a Service Bus Namespace and a Queue.
* [Deploy a Service Bus Topic with a Subscription to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-servicebus-topic/): Provisions a Resource Group containing a Service Bus Namespace, a Topic and a Subscription to that Topic.
* [Deploy an SSH Public Key to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-ssh-public-key/): Provisions a Resource Group containing an SSH Public Key.
* [Deploy a Storage Account to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-storage-account/): Provisions a Resource Group containing a Storage Account (StorageV2, Standard LRS).
* [Deploy a Storage Blob Container to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-storage-blob-container/): Provisions a Resource Group containing a Storage Account and a private Blob Container.
* [Deploy a Storage File Share to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-storage-file-share/): Provisions a Resource Group containing a Storage Account and a File Share.
* [Deploy a Storage Queue to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-storage-queue/): Provisions a Resource Group containing a Storage Account and a Queue.
* [Deploy a User-Assigned Managed Identity to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-user-assigned-identity/): Provisions a Resource Group containing a User-Assigned Managed Identity.
* [Deploy a Virtual Network with Subnets to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-virtual-network/): Provisions a Resource Group containing a Virtual Network with two Subnets.
* [Deploy a Virtual Network Peering to Locally using OpenTofu and the `Azure/azapi` provider](./opentofu/azapi-virtual-network-peering/): Provisions a Resource Group containing two Virtual Networks, peered with each other in both directions.
* [Deploy an Action Group to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-action-group/): Provisions a Resource Group containing an Action Group with a single email receiver.
* [Deploy an App Configuration Store to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-app-configuration/): Provisions a Resource Group containing an App Configuration Store (Free SKU).
* [Deploy an App Service Plan to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-app-service-plan/): Provisions a Resource Group containing a Linux App Service Plan (B1 SKU).
* [Deploy an Application Insights Component to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-application-insights/): Provisions a Resource Group containing a Log Analytics Workspace and a workspace-based Application Insights component.
* [Deploy an Application Security Group to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-application-security-group/): Provisions a Resource Group containing an Application Security Group.
* [Deploy an Availability Set to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-availability-set/): Provisions a Resource Group containing an Availability Set.
* [Deploy a Container Instance to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-container-instance/): Provisions a Resource Group containing a Container Group running the `mcr.microsoft.com/azuredocs/aci-helloworld` image.
* [Deploy a Container Registry to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-container-registry/): Provisions a Resource Group containing a Container Registry (Basic SKU, with the admin user disabled).
* [Deploy a Cosmos DB Account to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-cosmosdb-account/): Provisions a Resource Group containing a Cosmos DB for NoSQL account using Session consistency.
* [Deploy a Cosmos DB SQL Container to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-cosmosdb-sql-container/): Provisions a Resource Group containing a Cosmos DB for NoSQL account, a SQL Database and a Container partitioned on `/id`.
* [Deploy a Cosmos DB SQL Database to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-cosmosdb-sql-database/): Provisions a Resource Group containing a Cosmos DB for NoSQL account and a SQL Database with 400 RU/s of provisioned throughput.
* [Deploy a DDOS Protection Plan to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-ddos-protection-plan/): Provisions a Resource Group containing a DDOS Protection Plan.
* [Deploy a DNS Zone to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-dns-zone/): Provisions a Resource Group containing a public DNS Zone.
* [Deploy an Event Grid Topic to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-eventgrid-topic/): Provisions a Resource Group containing an Event Grid custom Topic.
* [Deploy an Event Hub to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-eventhub/): Provisions a Resource Group containing an Event Hubs Namespace, an Event Hub and a Consumer Group.
* [Deploy an Event Hubs Namespace to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-eventhub-namespace/): Provisions a Resource Group containing an Event Hubs Namespace (Standard SKU).
* [Deploy a Function App to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-function-app/): Provisions a Resource Group containing a Storage Account, a Linux App Service Plan and a Linux Function App.
* [Deploy a Key Vault to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-key-vault/): Provisions a Resource Group containing a Key Vault (Standard SKU).
* [Deploy a Key Vault Key to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-key-vault-key/): Provisions a Resource Group containing a Key Vault and an RSA Key stored within it.
* [Deploy a Key Vault Secret to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-key-vault-secret/): Provisions a Resource Group containing a Key Vault and a Secret stored within it.
* [Deploy a Linux Virtual Machine to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-linux-virtual-machine/): Provisions a Resource Group containing a Virtual Network, a Subnet, a Network Interface and a Linux Virtual Machine using SSH key authentication.
* [Deploy a Linux Web App to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-linux-web-app/): Provisions a Resource Group containing a Linux App Service Plan and a Linux Web App.
* [Deploy a Load Balancer to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-load-balancer/): Provisions a Resource Group containing a Public IP Address and a Standard Load Balancer with a frontend, a backend pool, a health probe and a load balancing rule.
* [Deploy a Log Analytics Workspace to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-log-analytics-workspace/): Provisions a Resource Group containing a Log Analytics Workspace.
* [Deploy a Managed Disk to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-managed-disk/): Provisions a Resource Group containing an empty 32 GB Managed Disk.
* [Deploy a Management Lock to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-management-lock/): Provisions a Resource Group containing a `CanNotDelete` Management Lock on the Resource Group.
* [Deploy a NAT Gateway to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-nat-gateway/): Provisions a Resource Group containing a Public IP Address, a NAT Gateway, and a Virtual Network whose Subnet routes outbound traffic through the NAT Gateway.
* [Deploy a Network Interface to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-network-interface/): Provisions a Resource Group containing a Virtual Network, a Subnet and a Network Interface.
* [Deploy a Network Security Group to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-network-security-group/): Provisions a Resource Group containing a Network Security Group with an inbound rule allowing HTTPS.
* [Deploy a PostgreSQL Flexible Server to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-postgresql-flexible-server/): Provisions a Resource Group containing a PostgreSQL Flexible Server and a Database.
* [Deploy a Private DNS Zone with a Virtual Network Link to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-private-dns-zone/): Provisions a Resource Group containing a Private DNS Zone, a Virtual Network and a Virtual Network Link between them.
* [Deploy a Private Endpoint to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-private-endpoint/): Provisions a Resource Group containing a Virtual Network, a Subnet, a Storage Account and a Private Endpoint connecting the Storage Account's Blob service into the Subnet.
* [Deploy a Proximity Placement Group to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-proximity-placement-group/): Provisions a Resource Group containing a Proximity Placement Group.
* [Deploy a Public IP Address to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-public-ip-address/): Provisions a Resource Group containing a Public IP Address.
* [Deploy a Redis Cache to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-redis-cache/): Provisions a Resource Group containing a Redis Cache (Basic C0).
* [Deploy a Resource Group to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-resource-group/): Provisions a single Resource Group.
* [Deploy a Role Assignment to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-role-assignment/): Provisions a Resource Group containing a User-Assigned Managed Identity and a Role Assignment granting it the built-in `Reader` role on the Resource Group.
* [Deploy a Custom Role Definition to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-role-definition/): Provisions a Resource Group containing a Custom Role Definition assignable at the Resource Group.
* [Deploy a Route Table to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-route-table/): Provisions a Resource Group containing a Route Table.
* [Deploy a Service Bus Namespace to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-servicebus-namespace/): Provisions a Resource Group containing a Service Bus Namespace (Standard SKU).
* [Deploy a Service Bus Queue to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-servicebus-queue/): Provisions a Resource Group containing a Service Bus Namespace and a Queue.
* [Deploy a Service Bus Topic with a Subscription to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-servicebus-topic/): Provisions a Resource Group containing a Service Bus Namespace, a Topic and a Subscription to that Topic.
* [Deploy an SSH Public Key to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-ssh-public-key/): Provisions a Resource Group containing an SSH Public Key.
* [Deploy a Storage Account to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-storage-account/): Provisions a Resource Group containing a Storage Account (StorageV2, Standard LRS).
* [Deploy a Storage Blob Container to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-storage-blob-container/): Provisions a Resource Group containing a Storage Account and a private Blob Container.
* [Deploy a Storage File Share to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-storage-file-share/): Provisions a Resource Group containing a Storage Account and a File Share.
* [Deploy a Storage Queue to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-storage-queue/): Provisions a Resource Group containing a Storage Account and a Queue.
* [Deploy a User-Assigned Managed Identity to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-user-assigned-identity/): Provisions a Resource Group containing a User-Assigned Managed Identity.
* [Deploy a Virtual Network with Subnets to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-virtual-network/): Provisions a Resource Group containing a Virtual Network with two Subnets.
* [Deploy a Virtual Network Peering to Locally using OpenTofu and the `opentofu/azurerm` provider](./opentofu/azurerm-virtual-network-peering/): Provisions a Resource Group containing two Virtual Networks, peered with each other in both directions.

### Azure PowerShell

See [`powershell/`](./powershell/) for more information.

* [Creating a Resource Group in Locally using Azure PowerShell](./powershell/#example-creating-a-resource-group-in-locally-using-azure-powershell): Creates a Resource Group using `New-AzResourceGroup`.
* [Creating an Availability Set in Locally using Azure PowerShell](./powershell/#example-creating-an-availability-set-in-locally-using-azure-powershell): Creates an Availability Set using `New-AzAvailabilitySet`.

### Pulumi (Azure Classic Provider, Go)

See [`pulumi/azure-classic-golang/`](./pulumi/azure-classic-golang/) for more information.

* [Deploy an Availability Set to Locally using Pulumi (Go) and the Azure Classic Provider](./pulumi/azure-classic-golang/availability-set/): Provisions a Resource Group containing an Availability Set.
* [Deploy a Container Instance to Locally using Pulumi (Go) and the Azure Classic Provider](./pulumi/azure-classic-golang/container-instance/): Provisions a Resource Group containing a Container Group running the `mcr.microsoft.com/azuredocs/aci-helloworld` image.
* [Deploy a Resource Group to Locally using Pulumi (Go) and the Azure Classic Provider](./pulumi/azure-classic-golang/resource-group/): Provisions a single Resource Group.
* [Deploy a Virtual Network with Subnets to Locally using Pulumi (Go) and the Azure Classic Provider](./pulumi/azure-classic-golang/virtual-network/): Provisions a Resource Group containing a Virtual Network with two Subnets.

### Pulumi (Azure Native Provider, Go)

See [`pulumi/azure-native-golang/`](./pulumi/azure-native-golang/) for more information.

* [Deploy an Availability Set to Locally using Pulumi (Go) and the Azure Native Provider](./pulumi/azure-native-golang/availability-set/): Provisions a Resource Group containing an Availability Set.
* [Deploy a Container Instance to Locally using Pulumi (Go) and the Azure Native Provider](./pulumi/azure-native-golang/container-instance/): Provisions a Resource Group containing a Container Group running the `mcr.microsoft.com/azuredocs/aci-helloworld` image.
* [Deploy a Resource Group to Locally using Pulumi (Go) and the Azure Native Provider](./pulumi/azure-native-golang/resource-group/): Provisions a single Resource Group.
* [Deploy a Virtual Network with Subnets to Locally using Pulumi (Go) and the Azure Native Provider](./pulumi/azure-native-golang/virtual-network/): Provisions a Resource Group containing a Virtual Network with two Subnets.

## Further Reading

More information and additional examples can be found in [Locally's documentation](https://locally.build/docs), including:

* [Guides on how to use Locally with other tooling](https://locally.build/docs/guides)
  * [Using Locally with ARM Templates](https://locally.build/docs/guides/arm-templates)
  * [Using Locally with the Azure CLI](https://locally.build/docs/guides/azure-cli)
  * [Using Locally with Azure PowerShell](https://locally.build/docs/guides/azure-powershell)
  * [Using Locally with Bicep](https://locally.build/docs/guides/bicep)
  * [Using Locally with HashiCorp Terraform](https://locally.build/docs/guides/hashicorp-terraform)
  * [Using Locally with OpenTofu](https://locally.build/docs/guides/opentofu)
  * [Using Locally with Pulumi](https://locally.build/docs/guides/pulumi)
  * [Using Locally with the Azure SDK for .NET](https://locally.build/docs/guides/azure-sdks/dotnet)
  * [Using Locally with the Azure SDK for Go](https://locally.build/docs/guides/azure-sdks/golang)
  * [Using Locally with the Azure SDK for Python](https://locally.build/docs/guides/azure-sdks/python)
* [Learn more about Locally's features](https://locally.build/docs/features)
