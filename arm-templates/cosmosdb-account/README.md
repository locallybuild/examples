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

# Example: Deploy a Cosmos DB Account to Locally using an ARM Template

This example shows how to deploy a Cosmos DB Account to [Locally Build](https://locally.build) using an ARM Template.

This example provisions a Cosmos DB for NoSQL account using Session consistency, into a Resource Group of your choosing.

> [!TIP]
> This example is also available as [a Bicep Template](../../bicep/cosmosdb-account/), and for [HashiCorp Terraform](../../hashicorp-terraform/azurerm-cosmosdb-account/) and [OpenTofu](../../opentofu/azurerm-cosmosdb-account/).

## Requirements

* [Locally Build](https://locally.build).
* The [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli) (only needed for Method 2 and for tearing it down).
* Either [Docker](https://www.docker.com) or [Podman](https://podman.io) (recommended).
* The Locally Plugin for `Microsoft.DocumentDB` installed (`locally plugin install --name Microsoft.DocumentDB`).

## Running the example

First up, we need to ensure our container runtime (Docker or Podman) is running, then launch Locally:

```bash
locally build
```

With Locally running, in another terminal we can deploy the template using either of the following methods.

### Method 1: Using `locally deploy` (recommended)

Locally's built-in `deploy` command deploys the template, creating the Resource Group if it doesn't exist:

```bash
locally deploy --resource-group example template.json
```

Omitting `--resource-group` generates a Resource Group name for you; `--subscription` and `--deployment` can also be used to choose the Subscription and the Deployment name, and `--mode` to choose between the `Incremental` (default) and `Complete` deployment modes.

### Method 2: Using the Azure CLI

```bash
locally run az group create --name example --location berlin
locally run az deployment group create --resource-group example --template-file template.json
```

See [the README for ARM Templates](../README.md) for more information on how deployments work in Locally, and the current limitations.

## Tearing it down

```bash
locally run az group delete --name example --yes
```
