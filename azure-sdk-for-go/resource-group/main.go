package main

import (
	"context"
	"log"
	"os"

	"github.com/Azure/azure-sdk-for-go/sdk/azcore"
	"github.com/Azure/azure-sdk-for-go/sdk/azcore/arm"
	"github.com/Azure/azure-sdk-for-go/sdk/azcore/cloud"
	"github.com/Azure/azure-sdk-for-go/sdk/azidentity"
	"github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/resources/armresources/v3"
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
	armClient := &arm.ClientOptions{
		ClientOptions: clientOptions,
	}

	// Set by `locally run`.
	subscriptionID := os.Getenv("AZURE_SUBSCRIPTION_ID")

	client, err := armresources.NewResourceGroupsClient(subscriptionID, credential, armClient)
	if err != nil {
		log.Fatalf("building the Resource Groups client: %+v", err)
	}

	ctx := context.Background()
	resourceGroupName := "rg-from-azure-sdk-for-go"
	location := "berlin"
	payload := armresources.ResourceGroup{
		Location: &location,
	}
	createResp, err := client.CreateOrUpdate(ctx, resourceGroupName, payload, nil)
	if err != nil {
		log.Fatalf("creating Resource Group %q: %+v", resourceGroupName, err)
	}

	log.Printf("Created Resource Group %q..", *createResp.ID)
}
