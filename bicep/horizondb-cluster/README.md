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

# Example: Deploy a HorizonDB Cluster to Locally using a Bicep Template

This example shows how to deploy a HorizonDB Cluster to [Locally Build](https://locally.build) using a Bicep Template.

This example provisions a HorizonDB Cluster running PostgreSQL 18, its administrator credentials, a Pool and a Firewall Rule, into a Resource Group of your choosing.

> [!NOTE]
> This example requires Locally v2026.11 or later, and the Locally Plugin for `Microsoft.HorizonDb` is available on the Standard plan and above.

> [!TIP]
> This example is also available as [an ARM Template](../../arm-templates/horizondb-cluster/), and for [HashiCorp Terraform](../../hashicorp-terraform/azapi-horizondb-cluster/) and [OpenTofu](../../opentofu/azapi-horizondb-cluster/).

## Requirements

* [Locally Build](https://locally.build).
* The [Bicep CLI](https://github.com/Azure/bicep) available on your `PATH`.
* The [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli) (only needed for Method 2, for deploying to Azure and for tearing it down).
* Either [Docker](https://www.docker.com) or [Podman](https://podman.io) (recommended).
* The Locally Plugin for `Microsoft.HorizonDb` installed (`locally plugin install --name Microsoft.HorizonDb`).

## Choosing where to deploy

This example deploys to [Locally](https://locally.build) by default, and can also be deployed to Azure.

The Region the resources are deployed into is controlled by the `location` parameter, which is set in a parameters file per target:

* [`parameters.locally.bicepparam`](parameters.locally.bicepparam) - deploys into the `berlin` Region in Locally (the default).
* [`parameters.azure.bicepparam`](parameters.azure.bicepparam) - deploys into the `westeurope` Region in Azure.

Update the `location` value in the relevant file to deploy into a different Region (`locally regions list` shows the Regions available in Locally). If no parameters file is specified, the resources are deployed into the same Region as the Resource Group.

## Running the example

First up, we need to ensure our container runtime (Docker or Podman) is running, then launch Locally:

```bash
locally build
```

With Locally running, in another terminal we can deploy the template using either of the following methods.

### Method 1: Using `locally deploy` (recommended)

Locally's built-in `deploy` command deploys the template, creating the Resource Group if it doesn't exist:

```bash
locally deploy --resource-group example --parameters parameters.locally.bicepparam template.bicep
```

> [!NOTE]
> `locally deploy` compiles the `.bicep` file to an ARM Template automatically before deploying it.

Omitting `--resource-group` generates a Resource Group name for you; `--subscription` and `--deployment` can also be used to choose the Subscription and the Deployment name, and `--mode` to choose between the `Incremental` (default) and `Complete` deployment modes.

### Method 2: Using the Azure CLI

```bash
locally run az group create --name example --location berlin
locally run az deployment group create --resource-group example --template-file template.bicep --parameters parameters.locally.bicepparam
```

See [the README for Bicep Templates](../README.md) for more information on how deployments work in Locally, and the current limitations.

## Deploying to Azure

The same template can be deployed to Azure using the Azure CLI, without Locally, once you're logged in (`az login`):

```bash
az group create --name example --location westeurope
az deployment group create --resource-group example --template-file template.bicep --parameters parameters.azure.bicepparam
```

> [!WARNING]
> Deploying to Azure creates real resources, which you'll be billed for.

## Notes

A HorizonDB Cluster is a logical parent: the compute lives in its Pools, and the administrator credentials are a singleton beneath the Cluster (`authentications/passwordMethod`). In Locally each Pool runs PostgreSQL in a container, using the Cluster's PostgreSQL version and administrator credentials.

Once deployed, the Cluster's Endpoints (the read-write endpoint for the Cluster, and a read-only endpoint per Pool) can be listed with:

```bash
locally run az rest --method get --url "/subscriptions/{subscriptionId}/resourceGroups/example/providers/Microsoft.HorizonDb/clusters/example-horizondb-from-bicep/endpoints?api-version=2026-10-01-preview"
```

The `fullyQualifiedDomainName` of each Endpoint is a `host:port` pair, which can be used to connect with `psql` (or any PostgreSQL client), using the administrator credentials from this example:

```bash
PGPASSWORD='Example-Passw0rd!' psql "host=<host> port=<port> user=exampleadmin dbname=postgres"
```

To keep the example self-contained the administrator password is hard-coded. A real configuration should source it from a secret store (e.g. Key Vault) rather than committing it.

HorizonDB is in preview in Azure and is only available in some Regions, so you may need to change the Region in the Azure parameters file.

The Bicep CLI doesn't include the types for API Version `2026-10-01-preview` yet, so it warns that it can't validate these resources (`BCP081`); the template still deploys.

## Tearing it down

In Locally:

```bash
locally run az group delete --name example --yes
```

Or, in Azure:

```bash
az group delete --name example --yes
```
