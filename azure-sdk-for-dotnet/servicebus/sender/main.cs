using System.Text.Json;
using Azure.Identity;
using Azure.Messaging.ServiceBus;

var fullyQualifiedNamespace = Environment.GetEnvironmentVariable("AZURE_SERVICEBUS_HOSTNAME")
    ?? "example-dotnet-servicebus-namespace.servicebus.locally";

var credential = new DefaultAzureCredential(new DefaultAzureCredentialOptions
{
    // Instance Discovery only trusts Microsoft-hosted tenants, so it has to be
    // disabled to authenticate against Locally.
    DisableInstanceDiscovery = true,
});

await using var client = new ServiceBusClient(fullyQualifiedNamespace, credential);

const string queueName = "example-queue";
await using var sender = client.CreateSender(queueName);

while (true)
{
    var payload = new
    {
        message = "Hello Locally from the Azure SDK for .NET!",
        timestamp = DateTime.UtcNow.ToString("o"),
    };
    var body = JsonSerializer.Serialize(payload);
    var message = new ServiceBusMessage(body);
    await sender.SendMessageAsync(message);

    Console.WriteLine($"Sent message to queue \"{queueName}\"");

    await Task.Delay(TimeSpan.FromSeconds(1));
}
