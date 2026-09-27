package main

import (
	"github.com/pulumi/pulumi-azure/sdk/v6/go/azure/core"
	"github.com/pulumi/pulumi-azure/sdk/v6/go/azure/network"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		resourceGroup, err := core.NewResourceGroup(ctx, "pulumi-resourcegroup", &core.ResourceGroupArgs{
			Location: pulumi.StringPtr("berlin"),
		})
		if err != nil {
			return err
		}

		vnet, err := network.NewVirtualNetwork(ctx, "example-vnet-from-pulumi-classic", &network.VirtualNetworkArgs{
			Location:          resourceGroup.Location,
			ResourceGroupName: resourceGroup.Name,
			AddressSpaces: pulumi.StringArray{
				pulumi.String("10.0.0.0/16"),
			},
		})
		if err != nil {
			return err
		}

		_, err = network.NewSubnet(ctx, "subnet-1", &network.SubnetArgs{
			ResourceGroupName:  resourceGroup.Name,
			VirtualNetworkName: vnet.Name,
			AddressPrefixes: pulumi.StringArray{
				pulumi.String("10.0.1.0/24"),
			},
		})
		if err != nil {
			return err
		}

		_, err = network.NewSubnet(ctx, "subnet-2", &network.SubnetArgs{
			ResourceGroupName:  resourceGroup.Name,
			VirtualNetworkName: vnet.Name,
			AddressPrefixes: pulumi.StringArray{
				pulumi.String("10.0.2.0/24"),
			},
		})
		if err != nil {
			return err
		}

		return nil
	})
}
