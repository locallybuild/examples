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

# Example: Send and receive Service Bus messages on Locally using the Azure SDK for Go

This example shows how to send and receive messages through a Service Bus Queue on [Locally Build](https://locally.build), from applications using the [Azure SDK for Go](https://github.com/Azure/azure-sdk-for-go).

It's made up of three parts:

* `terraform/` - provisions a Resource Group (`servicebus-resources`), a Service Bus Namespace (`example-servicebus-namespace`) and a Queue (`example-queue`).
* `sender/` - sends a message to the Queue every second.
* `processor/` - receives messages from the Queue and logs each one.

Both applications connect to the Namespace's hostname (`example-servicebus-namespace.servicebus.locally`, overridable via the `AZURE_SERVICEBUS_HOSTNAME` environment variable) and authenticate using `DefaultAzureCredential`, with the credentials supplied by `locally run`.

> [!TIP]
> This example is also available using [the Azure SDK for .NET](../../azure-sdk-for-dotnet/servicebus/).

## Requirements

* [Locally Build](https://locally.build).
* [Go](https://go.dev) (tested against `v1.27.1`).
* Either [HashiCorp Terraform](https://terraform.io) or [OpenTofu](https://opentofu.org).
* Either [Docker](https://www.docker.com) or [Podman](https://podman.io) (recommended).
* The Locally Plugin for `Microsoft.ServiceBus` installed (`locally plugin install --name Microsoft.ServiceBus`).

## Running the example

First up, we need to ensure our container runtime (Docker or Podman) is running, then launch Locally:

```bash
locally build
```

With Locally running, in another terminal we can provision the Service Bus Namespace and Queue:

```bash
cd terraform
terraform init
locally run terraform apply
cd ..
```

> [!NOTE]
> It's possible to use OpenTofu here by substituting `terraform` for `tofu`.

Next, build the sender and the processor:

```bash
cd sender && go build -o sender . && cd ..
cd processor && go build -o processor . && cd ..
```

Then run the processor in one terminal:

```bash
locally run ./processor/processor
```

And the sender in another:

```bash
locally run ./sender/sender
```

The sender sends a message to the Queue every second, and the processor receives and logs each one.

---

You can also browse the Queue and its messages in Locally's Service Bus UI:

```
https://example-servicebus-namespace.servicebus.locally:5662/_ui
```

(a link to this is also available in [the Locally Dashboard](https://localhost:5678)).

## Tearing it down

Stop the sender and the processor (`Ctrl+C`), then:

```bash
cd terraform
locally run terraform destroy
```
