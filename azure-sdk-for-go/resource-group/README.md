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

# Example: Deploy a Resource Group to Locally using the Azure SDK for Go

This example shows how to deploy a Resource Group to [Locally Build](https://locally.build) from an application using the [Azure SDK for Go](https://github.com/Azure/azure-sdk-for-go).

This example provisions a single Resource Group, named `rg-from-azure-sdk-for-go`. The application points the SDK at Locally's control plane (`https://localhost:5680`); `locally run` supplies the rest of what it needs - the Subscription ID via `AZURE_SUBSCRIPTION_ID`, and credentials which `DefaultAzureCredential` picks up automatically.

> [!TIP]
> This example is also available using [the Azure SDK for .NET](../../azure-sdk-for-dotnet/resource-group/).

## Requirements

* [Locally Build](https://locally.build).
* [Go](https://go.dev) (tested against `v1.27.1`).
* Either [Docker](https://www.docker.com) or [Podman](https://podman.io) (recommended).

## Running the example

First up, we need to ensure our container runtime (Docker or Podman) is running, then launch Locally:

```bash
locally build
```

With Locally running, in another terminal we can download the dependencies and compile the application:

```bash
go build -o example .
```

We can then run it against Locally:

```bash
locally run ./example
```

Once it completes, the resources are deployed into Locally - you can view them in [the Locally Dashboard](https://localhost:5678).

## Tearing it down

```bash
locally run az group delete --name rg-from-azure-sdk-for-go --yes
```

_(This uses the [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).)_
