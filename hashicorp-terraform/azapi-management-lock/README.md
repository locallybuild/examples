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

# Example: Deploy a Management Lock to Locally using Terraform and the `Azure/azapi` provider

This example shows how to deploy a Management Lock to [Locally Build](https://locally.build) using [HashiCorp Terraform](https://terraform.io) and the [`Azure/azapi`](https://registry.terraform.io/providers/Azure/azapi/latest) provider.

This example provisions a Resource Group containing a `CanNotDelete` Management Lock on the Resource Group.

> [!TIP]
> This example is also available using [the `hashicorp/azurerm` provider](../azurerm-management-lock/), and using [OpenTofu](../../opentofu/azapi-management-lock/).

## Requirements

* [Locally Build](https://locally.build).
* [HashiCorp Terraform](https://terraform.io) (v1.12.0 or later).
* Either [Docker](https://www.docker.com) or [Podman](https://podman.io) (recommended).

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

## Tearing it down

```bash
locally run terraform destroy
```
