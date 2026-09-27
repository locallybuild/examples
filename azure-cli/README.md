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

# Examples: Using Locally with the Azure CLI

## Dependencies

* [Azure CLI (v2)](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
* [Locally](https://locally.build)

## Get Started

The examples below assume that both the Azure CLI and [Locally](https://locally.build) are installed.

If you haven't already, we'll need to launch Locally, which can be done via:

```bash
locally build
```

Now that Locally is running, you can use the Azure CLI against Locally by prefixing any commands with `locally run`.

For example, where you would normally list Resource Groups in the Azure CLI using:

```bash
az group list
```

To instead run this command against Locally, you would run:

```bash
locally run az group list
```

### Example: Creating a Resource Group in Locally using the Azure CLI

```bash
locally run az group create -n azurecli-resources -l berlin
```

### Example: Creating an Availability Set in Locally using the Azure CLI

```bash
az vm availability-set create -n "azcli-avset" -g "azurecli-resources" -l "berlin" --platform-fault-domain-count 2 --platform-update-domain-count 5
```