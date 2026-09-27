using Azure;
using Azure.Identity;
using Azure.ResourceManager;
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
var createResult = await resourceGroupsClient.CreateOrUpdateAsync(WaitUntil.Completed, resourceGroupName, resourceGroup);
Console.WriteLine($"Created {createResult.Value.Data.Id}");