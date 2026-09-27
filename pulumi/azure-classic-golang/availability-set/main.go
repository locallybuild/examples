package main

import (
	"github.com/pulumi/pulumi-azure/sdk/v6/go/azure/compute"
	"github.com/pulumi/pulumi-azure/sdk/v6/go/azure/core"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		resourceGroup, err := core.NewResourceGroup(ctx, "pulumi-resourcegroup-avset", &core.ResourceGroupArgs{
			Location: pulumi.StringPtr("berlin"),
		})
		if err != nil {
			return err
		}

		_, err = compute.NewAvailabilitySet(ctx, "pulumi-availability-set", &compute.AvailabilitySetArgs{
			Name:              pulumi.String("pulumi-availability-set"),
			Location:          resourceGroup.Location,
			ResourceGroupName: resourceGroup.Name,
			Tags: pulumi.StringMap{
				"source": pulumi.String("Pulumi"),
			},
		})
		if err != nil {
			return err
		}

		return nil
	})
}
