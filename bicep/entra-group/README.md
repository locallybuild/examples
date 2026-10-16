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

# Example: Deploy an Entra Group to Locally using a Bicep Template

This example shows how to deploy an Entra Group to [Locally Build](https://locally.build) using a Bicep Template.

This example provisions an Entra Security Group, owned by Ada Lovelace with Grace Hopper, Alan Turing and the Research group (nested) as Members - all from the example directory seeded into Locally.

> [!TIP]
> This example is also available as [an ARM Template](../../arm-templates/entra-group/).

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

See [the README for Bicep Templates](../README.md) for more information on how deployments work in Locally, and the current limitations.

## Inspecting the result

Once deployed, the Azure CLI can be used to inspect what's been created:

```bash
locally run az ad group show --group "Example Group from Bicep"
locally run az ad group member list --group "Example Group from Bicep" --query "[].displayName"
```

## Notes

The Group's `uniqueName` (`example-group-from-bicep`) is how the Microsoft Graph extension identifies it, so re-deploying the template updates the existing Group rather than creating a second one.

The Microsoft Graph extension looks up an `existing` Group by its `uniqueName` - the Groups in the seeded example directory use their mail nickname as their `uniqueName`, which is how this template references the Research group (`research`) to nest it as a Member. Nesting a Group makes its Members (Claude Shannon, Katherine Johnson and Karen Spärck Jones) transitive, rather than direct, Members of this Group.

## Tearing it down

Entra objects live in the Directory rather than in the Resource Group, so deleting the Resource Group doesn't delete them - instead the Group needs to be deleted directly:

```bash
locally run az ad group delete --group "Example Group from Bicep"
locally run az group delete --name example --yes
```
