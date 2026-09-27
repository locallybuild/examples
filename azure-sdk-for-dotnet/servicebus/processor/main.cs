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
await using var receiver = client.CreateReceiver(queueName, new ServiceBusReceiverOptions
{
    ReceiveMode = ServiceBusReceiveMode.PeekLock,
});

while (true)
{
    var messages = await receiver.ReceiveMessagesAsync(maxMessages: 1, maxWaitTime: TimeSpan.FromSeconds(1));

    foreach (var msg in messages)
    {
        var payload = JsonSerializer.Deserialize<Dictionary<string, string>>(msg.Body.ToString())!;
        Console.WriteLine($"Received message: {payload["message"]} (sent at {payload["timestamp"]})");
        await receiver.CompleteMessageAsync(msg);
    }

    if (messages.Count == 0)
    {
        Console.WriteLine($"No messages available in queue \"{queueName}\"");
    }

    await Task.Delay(TimeSpan.FromSeconds(1));
}
