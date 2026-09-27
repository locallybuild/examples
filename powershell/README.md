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

# Examples: Using Locally with Azure PowerShell

## Dependencies

* [Azure Commandlets](https://github.com/Azure/azure-powershell?tab=readme-ov-file#installation)
* [Microsoft Entra Commandlets](https://learn.microsoft.com/en-us/powershell/entra-powershell/installation)
* [PowerShell 7.x](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.5)
* [Locally](https://locally.build)

## Get Started

The examples below assume that Locally is running, which can be done via:

```bash
locally build
```

Once Locally is up and running, you can launch an Azure PowerShell session that's configured to work against Locally by running:

```bash
locally run pwsh
```

On Windows, you'll want to run:

```bash
locally run pwsh.exe
```

Any PowerShell Commandlets run within this session will run against the Locally cloud environment.

> [!NOTE]
> If you haven't already installed the `Az` and `Microsoft.Entra` Commandlets, you'll need to run the following commands, and then relaunch `locally run pwsh` so that Locally can configure both Azure and Microsoft Graph:

```powershell
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
Install-Module -Name Microsoft.Entra -Scope CurrentUser -Repository PSGallery -Force
```

With PowerShell now configured for use with Locally, it's possible to list the available Subscriptions by running:

```powershell
Get-AzSubscription
```

Or to list the Resource Groups within the Primary Subscription, run:

```powershell
Get-AzResourceGroup
```

### Example: Creating a Resource Group in Locally using Azure PowerShell

```powershell
New-AzResourceGroup -Name hello-powershell -Location berlin

ResourceGroupName : hello-powershell
Location          : berlin
ProvisioningState : Succeeded
Tags              : 
ResourceId        : /subscriptions/df04ffc8-3123-4e6e-805d-e9a3b538917f/resourceGroups/hello-powershell
```

### Example: Creating an Availability Set in Locally using Azure PowerShell

```powershell
New-AzAvailabilitySet -Name pwsh-availability-set -ResourceGroupName hello-powershell -Location berlin -PlatformFaultDomainCount 2 -PlatformUpdateDomainCount 5

ResourceGroupName         : hello-powershell
Id                        : /subscriptions/df04ffc8-3123-4e6e-805d-e9a3b538917f/resourceGroups/hello-powershell/providers/Microsoft.Compute/availab
                            ilitySets/pwsh-availability-set
Name                      : pwsh-availability-set
Type                      : Microsoft.Compute/availabilitySets
Location                  : berlin
Managed                   : 
Sku                       : Classic
Tags                      : {}
PlatformFaultDomainCount  : 2
PlatformUpdateDomainCount : 5
Statuses                  : []
VirtualMachinesReferences : []
ProximityPlacementGroup   : 
```

## Example: Listing the Entra Users using Azure PowerShell

```powershell
Get-EntraUser

DisplayName        Id                                   Mail UserPrincipalName
-----------        --                                   ---- -----------------
Dennis Ritchie     0686c14e-12b7-48ec-9897-a59192470a99      dennis.ritchie@default.tenants.locally
Grace Hopper       1cb929ec-2007-41e8-98ef-50c05d070812      grace.hopper@default.tenants.locally
Edsger Dijkstra    2ac26a70-66f7-45da-9e6b-3db2cb3a9e8c      edsger.dijkstra@default.tenants.locally
Katherine Johnson  30a533b8-4a32-46b5-85ce-fb8d82a998e7      katherine.johnson@default.tenants.locally
Ada Lovelace       3ee3ec24-d0eb-4f28-9c8e-5078aa953cd8      ada.lovelace@default.tenants.locally
Karen Spärck Jones 610278b2-ba5b-4c6d-9b9a-bcef5f02b86f      karen.sparck.jones@default.tenants.locally
Margaret Hamilton  90df63fc-2723-437f-9b3b-2c0399be93f9      margaret.hamilton@default.tenants.locally
John von Neumann   9e4bf930-514f-410b-b941-dce97e12cfac      john.vonneumann@default.tenants.locally
Claude Shannon     b4214862-db7f-4ef6-90eb-8febf00e073b      claude.shannon@default.tenants.locally
Alan Turing        b483e7a5-d76b-4606-84da-7274ec7359ac      alan.turing@default.tenants.locally
Frances Allen      c516402a-e5ae-4d25-96eb-596b6092a0fe      frances.allen@default.tenants.locally
Douglas Engelbart  f5aa2869-8c23-44b5-8f53-4a91b07e8a7d      douglas.engelbart@default.tenants.locall
```
