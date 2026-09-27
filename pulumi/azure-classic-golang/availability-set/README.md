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

# Example: Deploy an Availability Set to Locally using Pulumi (Go) and the Azure Classic Provider

This example shows how to deploy an Availability Set to [Locally Build](https://locally.build) using [Pulumi](https://pulumi.com), written in Go, with the [Pulumi Azure Classic Provider](https://www.pulumi.com/registry/packages/azure/).

This example provisions a Resource Group containing an Availability Set.

> [!TIP]
> This example is also available using [the Pulumi Azure Native Provider](../../azure-native-golang/availability-set/).

## Requirements

* [Locally Build](https://locally.build).
* [Pulumi](https://pulumi.com) (tested against `v3.265.0`), with the [Pulumi Azure Classic Provider](https://www.pulumi.com/registry/packages/azure/) (tested against `v6.40.0`).
* [Go](https://go.dev) (tested against `v1.27.1`).
* Either [Docker](https://www.docker.com) or [Podman](https://podman.io) (recommended).
* The Locally Plugin for `Microsoft.Compute` installed (`locally plugin install --name Microsoft.Compute`).

## Running the example

First up, we need to ensure our container runtime (Docker or Podman) is running, then launch Locally:

```bash
locally build
```

With Locally running, in another terminal we can configure Pulumi to store its state on this machine, and create a Stack:

```bash
pulumi login --local
pulumi stack init dev
```

We can then provision the example by running:

```bash
locally run pulumi up
```

Pulumi downloads the Go dependencies and the provider plugin, then shows a preview; once you confirm it, the resources are deployed into Locally - you can view them in [the Locally Dashboard](https://localhost:5678).

## Tearing it down

```bash
locally run pulumi destroy
pulumi stack rm dev
```
