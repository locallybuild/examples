package main

import (
	"context"
	"log"
	"os"

	"github.com/Azure/azure-sdk-for-go/sdk/azcore"
	"github.com/Azure/azure-sdk-for-go/sdk/azcore/arm"
	"github.com/Azure/azure-sdk-for-go/sdk/azcore/cloud"
	"github.com/Azure/azure-sdk-for-go/sdk/azcore/to"
	"github.com/Azure/azure-sdk-for-go/sdk/azidentity"
	"github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/containerinstance/armcontainerinstance/v2"
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

	resourceGroupsClient, err := armresources.NewResourceGroupsClient(subscriptionID, credential, armClient)
	if err != nil {
		log.Fatalf("building the Resource Groups client: %+v", err)
	}

	containerGroupsClient, err := armcontainerinstance.NewContainerGroupsClient(subscriptionID, credential, armClient)
	if err != nil {
		log.Fatalf("building the Container Groups client: %+v", err)
	}

	ctx := context.Background()
	resourceGroupName := "rg-from-azure-sdk-for-go"
	location := "berlin"

	rgPayload := armresources.ResourceGroup{
		Location: &location,
	}
	createRgResp, err := resourceGroupsClient.CreateOrUpdate(ctx, resourceGroupName, rgPayload, nil)
	if err != nil {
		log.Fatalf("creating Resource Group %q: %+v", resourceGroupName, err)
	}
	log.Printf("Created Resource Group %q..", *createRgResp.ID)

	containerGroupName := "example-containergroup-from-azure-sdk-for-go"
	containerGroupPayload := armcontainerinstance.ContainerGroup{
		Location: &location,
		Properties: &armcontainerinstance.ContainerGroupPropertiesProperties{
			Containers: []*armcontainerinstance.Container{
				{
					Name: to.Ptr("hello-world"),
					Properties: &armcontainerinstance.ContainerProperties{
						Image: to.Ptr("mcr.microsoft.com/azuredocs/aci-helloworld"),
						Ports: []*armcontainerinstance.ContainerPort{
							{
								Port:     to.Ptr[int32](80),
								Protocol: to.Ptr(armcontainerinstance.ContainerNetworkProtocolTCP),
							},
						},
						Resources: &armcontainerinstance.ResourceRequirements{
							Requests: &armcontainerinstance.ResourceRequests{
								CPU:        to.Ptr[float64](1.0),
								MemoryInGB: to.Ptr[float64](1.5),
							},
						},
					},
				},
			},
			OSType: to.Ptr(armcontainerinstance.OperatingSystemTypesLinux),
			IPAddress: &armcontainerinstance.IPAddress{
				Type: to.Ptr(armcontainerinstance.ContainerGroupIPAddressTypePublic),
				Ports: []*armcontainerinstance.Port{
					{
						Port:     to.Ptr[int32](80),
						Protocol: to.Ptr(armcontainerinstance.ContainerGroupNetworkProtocolTCP),
					},
				},
			},
		},
	}
	containerGroupPoller, err := containerGroupsClient.BeginCreateOrUpdate(ctx, resourceGroupName, containerGroupName, containerGroupPayload, nil)
	if err != nil {
		log.Fatalf("creating Container Group %q: %+v", containerGroupName, err)
	}
	containerGroupResp, err := containerGroupPoller.PollUntilDone(ctx, nil)
	if err != nil {
		log.Fatalf("waiting for Container Group %q creation: %+v", containerGroupName, err)
	}
	log.Printf("Created Container Group %q..", *containerGroupResp.ID)
}
