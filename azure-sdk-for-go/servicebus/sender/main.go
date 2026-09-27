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
	sender, err := client.NewSender(queueName, nil)
	if err != nil {
		log.Fatalf("creating sender for queue %q: %v", queueName, err)
	}
	defer sender.Close(context.Background())

	ctx := context.Background()
	ticker := time.NewTicker(1 * time.Second)
	defer ticker.Stop()

	for {
		payload := map[string]string{
			"message":   "Hello Locally from the Azure SDK for Go!",
			"timestamp": time.Now().UTC().Format(time.RFC3339),
		}
		body, err := json.Marshal(payload)
		if err != nil {
			log.Fatalf("marshalling message payload: %v", err)
		}
		message := &azservicebus.Message{
			Body: body,
		}
		if err := sender.SendMessage(ctx, message, nil); err != nil {
			log.Fatalf("sending message: %v", err)
		}

		log.Printf("Sent message to queue %q", queueName)

		<-ticker.C
	}
}
