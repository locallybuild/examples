package main

import (
	"github.com/pulumi/pulumi-azure-native-sdk/compute/v3"
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

		_, err = compute.NewAvailabilitySet(ctx, "pulumi-native-availability-set", &compute.AvailabilitySetArgs{
			Location:                  resourceGroup.Location,
			ResourceGroupName:         resourceGroup.Name,
			PlatformFaultDomainCount:  pulumi.Int(2),
			PlatformUpdateDomainCount: pulumi.Int(5),
		})
		if err != nil {
			return err
		}

		return nil
	})
}
