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
	"github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/network/armnetwork/v9"
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

	virtualNetworksClient, err := armnetwork.NewVirtualNetworksClient(subscriptionID, credential, armClient)
	if err != nil {
		log.Fatalf("building the Virtual Networks client: %+v", err)
	}

	subnetsClient, err := armnetwork.NewSubnetsClient(subscriptionID, credential, armClient)
	if err != nil {
		log.Fatalf("building the Subnets client: %+v", err)
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

	vnetName := "example-vnet-from-azure-sdk-for-go"
	vnetPayload := armnetwork.VirtualNetwork{
		Location: &location,
		Properties: &armnetwork.VirtualNetworkPropertiesFormat{
			AddressSpace: &armnetwork.AddressSpace{
				AddressPrefixes: []*string{
					to.Ptr("10.0.0.0/16"),
				},
			},
		},
	}
	vnetPoller, err := virtualNetworksClient.BeginCreateOrUpdate(ctx, resourceGroupName, vnetName, vnetPayload, nil)
	if err != nil {
		log.Fatalf("creating Virtual Network %q: %+v", vnetName, err)
	}
	vnetResp, err := vnetPoller.PollUntilDone(ctx, nil)
	if err != nil {
		log.Fatalf("waiting for Virtual Network %q creation: %+v", vnetName, err)
	}
	log.Printf("Created Virtual Network %q..", *vnetResp.ID)

	subnet1Name := "subnet-1"
	subnet1Payload := armnetwork.Subnet{
		Properties: &armnetwork.SubnetPropertiesFormat{
			AddressPrefix: to.Ptr("10.0.1.0/24"),
		},
	}
	subnet1Poller, err := subnetsClient.BeginCreateOrUpdate(ctx, resourceGroupName, vnetName, subnet1Name, subnet1Payload, nil)
	if err != nil {
		log.Fatalf("creating Subnet %q: %+v", subnet1Name, err)
	}
	subnet1Resp, err := subnet1Poller.PollUntilDone(ctx, nil)
	if err != nil {
		log.Fatalf("waiting for Subnet %q creation: %+v", subnet1Name, err)
	}
	log.Printf("Created Subnet %q..", *subnet1Resp.ID)

	subnet2Name := "subnet-2"
	subnet2Payload := armnetwork.Subnet{
		Properties: &armnetwork.SubnetPropertiesFormat{
			AddressPrefix: to.Ptr("10.0.2.0/24"),
		},
	}
	subnet2Poller, err := subnetsClient.BeginCreateOrUpdate(ctx, resourceGroupName, vnetName, subnet2Name, subnet2Payload, nil)
	if err != nil {
		log.Fatalf("creating Subnet %q: %+v", subnet2Name, err)
	}
	subnet2Resp, err := subnet2Poller.PollUntilDone(ctx, nil)
	if err != nil {
		log.Fatalf("waiting for Subnet %q creation: %+v", subnet2Name, err)
	}
	log.Printf("Created Subnet %q..", *subnet2Resp.ID)
}
