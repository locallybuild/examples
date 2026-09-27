using Azure;
using Azure.Identity;
using Azure.ResourceManager;
using Azure.ResourceManager.Network;
using Azure.ResourceManager.Network.Models;
using Azure.ResourceManager.Resources;

var clientOptions = new ArmClientOptions
{
    // Connect to Locally rather than Azure Public
    Environment = new ArmEnvironment(new Uri("https://localhost:5680"), "https://localhost:5680"),
};
var credential = new DefaultAzureCredential(new DefaultAzureCredentialOptions
{
    // Instance Discovery only trusts Microsoft-hosted tenants, so it has to be
    // disabled to authenticate against Locally.
    DisableInstanceDiscovery = true,
});

// Set by `locally run`.
var defaultSubscriptionId = Environment.GetEnvironmentVariable("AZURE_SUBSCRIPTION_ID")!;

var resourceClient = new ArmClient(credential, defaultSubscriptionId, clientOptions);

var subscription = await resourceClient.GetDefaultSubscriptionAsync();
var resourceGroupsClient = subscription.GetResourceGroups();

const string resourceGroupName = "rg-from-azure-sdk-for-dotnet";
const string location = "berlin";

var resourceGroup = new ResourceGroupData(location);
var createRgResult = await resourceGroupsClient.CreateOrUpdateAsync(WaitUntil.Completed, resourceGroupName, resourceGroup);
Console.WriteLine($"Created Resource Group {createRgResult.Value.Data.Id}");

const string vnetName = "example-vnet-from-azure-sdk-for-dotnet";
var vnetData = new VirtualNetworkData()
{
    Location = location,
    AddressPrefixes = { "10.0.0.0/16" },
    Subnets = {
        new SubnetData()
        {
            Name = "subnet-1",
            AddressPrefix = "10.0.1.0/24"
        },
        new SubnetData()
        {
            Name = "subnet-2", 
            AddressPrefix = "10.0.2.0/24"
        }
    }
};

var vnetCollection = createRgResult.Value.GetVirtualNetworks();
var createVnetResult = await vnetCollection.CreateOrUpdateAsync(WaitUntil.Completed, vnetName, vnetData);
Console.WriteLine($"Created Virtual Network {createVnetResult.Value.Data.Id}");

var subnetsCollection = createVnetResult.Value.GetSubnets();
await foreach (var subnet in subnetsCollection.GetAllAsync())
{
    Console.WriteLine($"Created Subnet {subnet.Data.Id}");
}