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

# Example: Deploy a Durable Functions App to Locally using Terraform and the `hashicorp/azurerm` provider

This example shows how to deploy a Durable Functions App to [Locally Build](https://locally.build) using [HashiCorp Terraform](https://terraform.io) and the [`hashicorp/azurerm`](https://registry.terraform.io/providers/hashicorp/azurerm/latest) provider.

This example provisions a Resource Group containing a Storage Account, a Durable Task Scheduler with a Task Hub, a Linux App Service Plan and a Linux Function App which uses the Durable Task Scheduler as its Durable Functions backend.

> [!TIP]
> This example is also available using [the `Azure/azapi` provider](../azapi-durable-functions/), and using [OpenTofu](../../opentofu/azurerm-durable-functions/).

> [!NOTE]
> The `hashicorp/azurerm` provider doesn't yet support the Durable Task Scheduler, so this example also uses [the `Azure/azapi` provider](https://registry.terraform.io/providers/Azure/azapi/latest) to provision the Durable Task Scheduler and its Task Hub.

## Requirements

* [Locally Build](https://locally.build).
* [HashiCorp Terraform](https://terraform.io) (v1.12.0 or later).
* Either [Docker](https://www.docker.com) or [Podman](https://podman.io) (recommended).
* The Locally Plugin for `Microsoft.DurableTask` installed (`locally plugin install --name Microsoft.DurableTask`).
* The Locally Plugin for `Microsoft.Storage` installed (`locally plugin install --name Microsoft.Storage`).
* The Locally Plugin for `Microsoft.Web` installed (`locally plugin install --name Microsoft.Web`).

## Running the example

First up, we need to ensure our container runtime (Docker or Podman) is running, then launch Locally:

```bash
locally build
```

With Locally running, in another terminal we can initialise Terraform, which downloads the providers we need:

```bash
terraform init
```

With Terraform initialised, we can then provision the example by running:

```bash
locally run terraform apply
```

Once you approve the plan, the resources are deployed into Locally - you can view them in [the Locally Dashboard](https://localhost:5678).

## Using the Durable Task Scheduler from your Function App

The Function App is configured with the `DURABLE_TASK_SCHEDULER_CONNECTION_STRING` and `TASKHUB_NAME` App Settings, and its System-Assigned Identity is granted the `Durable Task Data Contributor` role on the Durable Task Scheduler.

To use these, configure the Durable Functions extension in your app's `host.json` to use the Durable Task Scheduler as its storage provider:

```json
{
  "version": "2.0",
  "extensions": {
    "durableTask": {
      "hubName": "%TASKHUB_NAME%",
      "storageProvider": {
        "type": "azureManaged",
        "connectionStringName": "DURABLE_TASK_SCHEDULER_CONNECTION_STRING"
      }
    }
  }
}
```

## Tearing it down

```bash
locally run terraform destroy
```
