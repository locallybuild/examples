package main

import (
	"github.com/pulumi/pulumi-azure/sdk/v6/go/azure/containerservice"
	"github.com/pulumi/pulumi-azure/sdk/v6/go/azure/core"
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

		_, err = containerservice.NewGroup(ctx, "example-containergroup-from-pulumi-classic", &containerservice.GroupArgs{
			Location:          resourceGroup.Location,
			ResourceGroupName: resourceGroup.Name,
			OsType:            pulumi.String("Linux"),
			IpAddressType:     pulumi.String("Public"),
			Containers: containerservice.GroupContainerArray{
				&containerservice.GroupContainerArgs{
					Name:   pulumi.String("hello-world"),
					Image:  pulumi.String("mcr.microsoft.com/azuredocs/aci-helloworld"),
					Cpu:    pulumi.Float64(1.0),
					Memory: pulumi.Float64(1.5),
					Ports: containerservice.GroupContainerPortArray{
						&containerservice.GroupContainerPortArgs{
							Port:     pulumi.Int(80),
							Protocol: pulumi.String("TCP"),
						},
					},
				},
			},
		})
		if err != nil {
			return err
		}

		return nil
	})
}
