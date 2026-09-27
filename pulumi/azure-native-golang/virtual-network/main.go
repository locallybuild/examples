package main

import (
	"github.com/pulumi/pulumi-azure-native-sdk/network/v3"
	"github.com/pulumi/pulumi-azure-native-sdk/resources/v3"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		resourceGroup, err := resources.NewResourceGroup(ctx, "pulumi-native-resource-group", &resources.ResourceGroupArgs{
			Location: pulumi.String("berlin"),
		})
		if err != nil {
			return err
		}

		vnet, err := network.NewVirtualNetwork(ctx, "example-vnet-from-pulumi", &network.VirtualNetworkArgs{
			Location:          resourceGroup.Location,
			ResourceGroupName: resourceGroup.Name,
			AddressSpace: &network.AddressSpaceArgs{
				AddressPrefixes: pulumi.StringArray{
					pulumi.String("10.0.0.0/16"),
				},
			},
		})
		if err != nil {
			return err
		}

		_, err = network.NewSubnet(ctx, "subnet-1", &network.SubnetArgs{
			ResourceGroupName:  resourceGroup.Name,
			VirtualNetworkName: vnet.Name,
			AddressPrefix:      pulumi.String("10.0.1.0/24"),
		})
		if err != nil {
			return err
		}

		_, err = network.NewSubnet(ctx, "subnet-2", &network.SubnetArgs{
			ResourceGroupName:  resourceGroup.Name,
			VirtualNetworkName: vnet.Name,
			AddressPrefix:      pulumi.String("10.0.2.0/24"),
		})
		if err != nil {
			return err
		}

		return nil
	})
}
