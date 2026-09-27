using Azure;
using Azure.Core;
using Azure.Identity;
using Azure.ResourceManager;
using Azure.ResourceManager.ContainerInstance;
using Azure.ResourceManager.ContainerInstance.Models;
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

const string containerGroupName = "example-containergroup-from-azure-sdk-for-dotnet";
var containerGroupData = new ContainerGroupData(new AzureLocation(location), new[]
{
    new ContainerInstanceContainer("hello-world", "mcr.microsoft.com/azuredocs/aci-helloworld", new ContainerResourceRequirements(new ContainerResourceRequestsContent(1.5, 1.0)))
    {
        Ports =
        {
            new ContainerPort(80) { Protocol = ContainerNetworkProtocol.Tcp }
        }
    }
}, ContainerInstanceOperatingSystemType.Linux)
{
    IPAddress = new ContainerGroupIPAddress(new[]
    {
        new ContainerGroupPort(80) { Protocol = ContainerGroupNetworkProtocol.Tcp }
    }, ContainerGroupIPAddressType.Public),
};

var containerGroupCollection = createRgResult.Value.GetContainerGroups();
var createContainerGroupResult = await containerGroupCollection.CreateOrUpdateAsync(WaitUntil.Completed, containerGroupName, containerGroupData);
Console.WriteLine($"Created Container Group {createContainerGroupResult.Value.Data.Id}");
