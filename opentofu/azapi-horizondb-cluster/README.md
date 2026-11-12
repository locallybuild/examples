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

# Example: Deploy a HorizonDB Cluster to Locally using OpenTofu and the `Azure/azapi` provider

This example shows how to deploy a HorizonDB Cluster to [Locally Build](https://locally.build) using [OpenTofu](https://opentofu.org) and the [`Azure/azapi`](https://search.opentofu.org/provider/azure/azapi/latest) provider.

This example provisions a Resource Group containing a HorizonDB Cluster running PostgreSQL 18, its administrator credentials, a Pool and a Firewall Rule.

> [!NOTE]
> This example requires Locally v2026.11 or later, and the Locally Plugin for `Microsoft.HorizonDb` is available on the Standard plan and above.

> [!TIP]
> This example is also available using [HashiCorp Terraform](../../hashicorp-terraform/azapi-horizondb-cluster/).

## Requirements

* [Locally Build](https://locally.build).
* [OpenTofu](https://opentofu.org) (v1.12.0 or later).
* Either [Docker](https://www.docker.com) or [Podman](https://podman.io) (recommended).
* The Locally Plugin for `Microsoft.HorizonDb` installed (`locally plugin install --name Microsoft.HorizonDb`).

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

A HorizonDB Cluster is a logical parent: the compute lives in its Pools, and the administrator credentials are a singleton beneath the Cluster (`authentications/passwordMethod`). In Locally each Pool runs PostgreSQL in a container, using the Cluster's PostgreSQL version and administrator credentials.

Once deployed, the Cluster's Endpoints (the read-write endpoint for the Cluster, and a read-only endpoint per Pool) can be listed with:

```bash
locally run az rest --method get --url "/subscriptions/{subscriptionId}/resourceGroups/opentofu-azapi-horizondb-cluster/providers/Microsoft.HorizonDb/clusters/example-horizondb-from-opentofu-azapi/endpoints?api-version=2026-10-01-preview"
```

The `fullyQualifiedDomainName` of each Endpoint is a `host:port` pair, which can be used to connect with `psql` (or any PostgreSQL client), using the administrator credentials from this example:

```bash
PGPASSWORD='Example-Passw0rd!' psql "host=<host> port=<port> user=exampleadmin dbname=postgres"
```

To keep the example self-contained the administrator password is hard-coded. A real configuration should source it from a secret store (e.g. Key Vault) rather than committing it.

The `Azure/azapi` provider doesn't include the schema for API Version `2026-10-01-preview` yet, so schema validation is disabled for these resources. The `hashicorp/azurerm` provider doesn't support HorizonDB yet, so this example is only available using the `Azure/azapi` provider.

## Tearing it down

```bash
locally run tofu destroy
```
