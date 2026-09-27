package main

import (
	"context"
	"encoding/json"
	"log"
	"os"
	"time"

	"github.com/Azure/azure-sdk-for-go/sdk/azcore"
	"github.com/Azure/azure-sdk-for-go/sdk/azcore/cloud"
	"github.com/Azure/azure-sdk-for-go/sdk/azidentity"
	"github.com/Azure/azure-sdk-for-go/sdk/messaging/azservicebus"
)

func main() {
	clientOptions := azcore.ClientOptions{
		// Connect to Locally rather than Azure Public
		Cloud: cloud.Configuration{
			Services: map[cloud.ServiceName]cloud.ServiceConfiguration{
				cloud.ResourceManager: {
					Audience: "https://localhost:5680",
					Endpoint: "https://localhost:5680",
				},
			},
		},
	}
	credential, err := azidentity.NewDefaultAzureCredential(&azidentity.DefaultAzureCredentialOptions{
		ClientOptions: clientOptions,

		// Instance Discovery only trusts Microsoft-hosted tenants, so it has to be
		// disabled to authenticate against Locally.
		DisableInstanceDiscovery: true,
	})
	if err != nil {
		log.Fatalf("building DefaultAzureCredential: %v", err)
	}

	fullyQualifiedNamespace := os.Getenv("AZURE_SERVICEBUS_HOSTNAME")
	if fullyQualifiedNamespace == "" {
		fullyQualifiedNamespace = "example-servicebus-namespace.servicebus.locally"
	}

	client, err := azservicebus.NewClient(fullyQualifiedNamespace, credential, nil)
	if err != nil {
		log.Fatalf("building ServiceBus client: %v", err)
	}
	defer client.Close(context.Background())

	queueName := "example-queue"
	receiver, err := client.NewReceiverForQueue(queueName, nil)
	if err != nil {
		log.Fatalf("creating receiver for queue %q: %v", queueName, err)
	}
	defer receiver.Close(context.Background())

	ctx := context.Background()
	ticker := time.NewTicker(1 * time.Second)
	defer ticker.Stop()

	for {
		messages, err := receiver.ReceiveMessages(ctx, 1, nil)
		if err != nil {
			log.Fatalf("receiving messages: %v", err)
		}

		for _, msg := range messages {
			var payload map[string]string
			if err := json.Unmarshal(msg.Body, &payload); err != nil {
				log.Fatalf("unmarshalling message: %v", err)
			}

			log.Printf("Received message: %s (sent at %s)", payload["message"], payload["timestamp"])

			if err := receiver.CompleteMessage(ctx, msg, nil); err != nil {
				log.Fatalf("completing message: %v", err)
			}
		}

		if len(messages) == 0 {
			log.Printf("No messages available in queue %q", queueName)
		}

		<-ticker.C
	}
}
