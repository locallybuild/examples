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

# Example: Deploy a Key Vault Key to Locally using OpenTofu and the `opentofu/azurerm` provider

This example shows how to deploy a Key Vault Key to [Locally Build](https://locally.build) using [OpenTofu](https://opentofu.org) and the [`opentofu/azurerm`](https://search.opentofu.org/provider/opentofu/azurerm/latest) provider.

This example provisions a Resource Group containing a Key Vault and an RSA Key stored within it.

> [!TIP]
> This example is also available using [the `Azure/azapi` provider](../azapi-key-vault-key/), and using [HashiCorp Terraform](../../hashicorp-terraform/azurerm-key-vault-key/).

## Requirements

* [Locally Build](https://locally.build).
* [OpenTofu](https://opentofu.org) (v1.12.0 or later).
* Either [Docker](https://www.docker.com) or [Podman](https://podman.io) (recommended).
* The Locally Plugin for `Microsoft.KeyVault` installed (`locally plugin install --name Microsoft.KeyVault`).

## Running the example

First up, we need to ensure our container runtime (Docker or Podman) is running, then launch Locally:

```bash
locally build
```

With Locally running, in another terminal we can initialise OpenTofu, which downloads the providers we need:

```bash
tofu init
```

With OpenTofu initialised, we can then provision the example by running:

```bash
locally run tofu apply
```

Once you approve the plan, the resources are deployed into Locally - you can view them in [the Locally Dashboard](https://localhost:5678).

## Notes

Since the Key Vault uses RBAC authorisation, the configuration also grants the caller the `Key Vault Crypto Officer` role on the vault, so that it can create the Key.

## Tearing it down

```bash
locally run tofu destroy
```
