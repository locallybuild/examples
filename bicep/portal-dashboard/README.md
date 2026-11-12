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

# Example: Deploy a Portal Dashboard to Locally using a Bicep Template

This example shows how to deploy a Portal Dashboard to [Locally Build](https://locally.build) using a Bicep Template.

This example provisions a shared Portal Dashboard containing two Markdown tiles, into a Resource Group of your choosing.

> [!NOTE]
> This example requires Locally v2026.11 or later, and the Locally Plugin for `Microsoft.Portal` is available on the Standard plan and above.

> [!TIP]
> This example is also available as [an ARM Template](../../arm-templates/portal-dashboard/), and for [HashiCorp Terraform](../../hashicorp-terraform/azurerm-portal-dashboard/) and [OpenTofu](../../opentofu/azurerm-portal-dashboard/).

## Requirements

* [Locally Build](https://locally.build).
* The [Bicep CLI](https://github.com/Azure/bicep) available on your `PATH`.
* The [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli) (only needed for Method 2, for deploying to Azure and for tearing it down).
* Either [Docker](https://www.docker.com) or [Podman](https://podman.io) (recommended).
* The Locally Plugin for `Microsoft.Portal` installed (`locally plugin install --name Microsoft.Portal`).

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

Once deployed, the Dashboard can be viewed in [the Locally Dashboard](https://localhost:5678). The `hidden-title` tag sets the name the Dashboard is shown with.

## Tearing it down

In Locally:

```bash
locally run az group delete --name example --yes
```

Or, in Azure:

```bash
az group delete --name example --yes
```
