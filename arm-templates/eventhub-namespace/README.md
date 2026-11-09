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

# Example: Deploy an Event Hubs Namespace to Locally using an ARM Template

[![Deploy to Locally](https://locally.build/deploy-to-locally.svg)](https://localhost:5678/deploy-to-locally?uri=https%3A%2F%2Fraw.githubusercontent.com%2Flocallybuild%2Fexamples%2Fmain%2Farm-templates%2Feventhub-namespace%2Ftemplate.json)

This example shows how to deploy an Event Hubs Namespace to [Locally Build](https://locally.build) using an ARM Template.

This example provisions an Event Hubs Namespace (Standard SKU), into a Resource Group of your choosing.

> [!TIP]
> This example is also available as [a Bicep Template](../../bicep/eventhub-namespace/), and for [HashiCorp Terraform](../../hashicorp-terraform/azurerm-eventhub-namespace/) and [OpenTofu](../../opentofu/azurerm-eventhub-namespace/).

## Requirements

* [Locally Build](https://locally.build).
* The [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli) (only needed for Method 2, for deploying to Azure and for tearing it down).
* Either [Docker](https://www.docker.com) or [Podman](https://podman.io) (recommended).
* The Locally Plugin for `Microsoft.EventHub` installed (`locally plugin install --name Microsoft.EventHub`).

## Choosing where to deploy

This example deploys to [Locally](https://locally.build) by default, and can also be deployed to Azure.

The Region the resources are deployed into is controlled by the `location` parameter, which is set in a parameters file per target:

* [`parameters.locally.json`](parameters.locally.json) - deploys into the `berlin` Region in Locally (the default).
* [`parameters.azure.json`](parameters.azure.json) - deploys into the `westeurope` Region in Azure.

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
locally deploy --resource-group example --parameters parameters.locally.json template.json
```

Omitting `--resource-group` generates a Resource Group name for you; `--subscription` and `--deployment` can also be used to choose the Subscription and the Deployment name, and `--mode` to choose between the `Incremental` (default) and `Complete` deployment modes.

### Method 2: Using the Azure CLI

```bash
locally run az group create --name example --location berlin
locally run az deployment group create --resource-group example --template-file template.json --parameters parameters.locally.json
```

See [the README for ARM Templates](../README.md) for more information on how deployments work in Locally, and the current limitations.

## Deploying to Azure

The same template can be deployed to Azure using the Azure CLI, without Locally, once you're logged in (`az login`):

```bash
az group create --name example --location westeurope
az deployment group create --resource-group example --template-file template.json --parameters parameters.azure.json
```

> [!WARNING]
> Deploying to Azure creates real resources, which you'll be billed for.

## Tearing it down

In Locally:

```bash
locally run az group delete --name example --yes
```

Or, in Azure:

```bash
az group delete --name example --yes
```
