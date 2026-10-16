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

# Example: Look up an existing Entra User in Locally using a Bicep Template

This example shows how to reference an existing Entra User in [Locally Build](https://locally.build) using a Bicep Template.

This example looks up an existing Entra User (by default Ada Lovelace, from the example directory seeded into Locally) and outputs their Object ID, Display Name and Job Title.

> [!TIP]
> This example is also available as [an ARM Template](../../arm-templates/entra-user/).

## Requirements

* [Locally Build](https://locally.build).
* The [Bicep CLI](https://github.com/Azure/bicep) available on your `PATH`.
* Either [Docker](https://www.docker.com) or [Podman](https://podman.io) (recommended).

## About the Microsoft Graph extension

Entra objects (Users, Groups, Applications and Service Principals) aren't Azure Resources - they live in the Directory (Tenant) rather than in a Resource Group, so they're managed using [the Microsoft Graph Bicep extension](https://learn.microsoft.com/graph/templates/bicep/overview-bicep-templates-for-graph) rather than a Resource Provider.

The `bicepconfig.json` file alongside the template enables this extension:

```json
{
  "extensions": {
    "microsoftGraphV1": "br:mcr.microsoft.com/bicep/extensions/microsoftgraph/v1.0:1.0.0"
  }
}
```

The Bicep CLI downloads the extension from the Microsoft Container Registry the first time the template is compiled, and caches it from then on.

## Running the example

First up, we need to ensure our container runtime (Docker or Podman) is running, then launch Locally:

```bash
locally build
```

With Locally running, in another terminal we can deploy the template using either of the following methods.

### Method 1: Using `locally deploy` (recommended)

Locally's built-in `deploy` command deploys the template, creating the Resource Group if it doesn't exist:

```bash
locally deploy --resource-group example template.bicep
```

> [!NOTE]
> `locally deploy` compiles the `.bicep` file to an ARM Template automatically before deploying it.

Whilst Entra objects aren't created within the Resource Group, the deployment itself is recorded there.

Omitting `--resource-group` generates a Resource Group name for you; `--subscription` and `--deployment` can also be used to choose the Subscription and the Deployment name.

### Method 2: Using the Azure CLI

```bash
locally run az group create --name example --location berlin
locally run az deployment group create --resource-group example --template-file template.bicep
```

To look up a different User, override the `userPrincipalName` parameter:

```bash
locally run az deployment group create --resource-group example --template-file template.bicep --parameters userPrincipalName=grace.hopper@default.tenants.locally
```

See [the README for Bicep Templates](../README.md) for more information on how deployments work in Locally, and the current limitations.

## Notes

Users can't be created using a Bicep Template - the Microsoft Graph extension only supports Users as an `existing` resource, so they can be referenced (for example, to make them the Owner or a Member of a Group) but not provisioned. This is a limitation of the Microsoft Graph extension, rather than of Locally - and so this applies to Azure too.

Every Locally instance is seeded with the same example directory, so the Users within it (such as `ada.lovelace@default.tenants.locally` and `grace.hopper@default.tenants.locally`) can be referenced from templates without creating them first. Check out [the Groups example](../entra-group/) for an example of how to use them.

## Tearing it down

Since this example only reads an existing User, there's nothing in the Directory to tear down - removing the Resource Group removes the record of the deployment:

```bash
locally run az group delete --name example --yes
```
