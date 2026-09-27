package main

import (
	"github.com/pulumi/pulumi-azure-native-sdk/containerinstance/v3"
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

		_, err = containerinstance.NewContainerGroup(ctx, "example-containergroup-from-pulumi", &containerinstance.ContainerGroupArgs{
			Location:          resourceGroup.Location,
			ResourceGroupName: resourceGroup.Name,
			OsType:            pulumi.String("Linux"),
			Containers: containerinstance.ContainerArray{
				&containerinstance.ContainerArgs{
					Name:  pulumi.String("hello-world"),
					Image: pulumi.String("mcr.microsoft.com/azuredocs/aci-helloworld"),
					Ports: containerinstance.ContainerPortArray{
						&containerinstance.ContainerPortArgs{
							Port:     pulumi.Int(80),
							Protocol: pulumi.String("TCP"),
						},
					},
					Resources: &containerinstance.ResourceRequirementsArgs{
						Requests: &containerinstance.ResourceRequestsArgs{
							Cpu:        pulumi.Float64(1.0),
							MemoryInGB: pulumi.Float64(1.5),
						},
					},
				},
			},
			IpAddress: &containerinstance.IpAddressArgs{
				Type: pulumi.String("Public"),
				Ports: containerinstance.PortArray{
					&containerinstance.PortArgs{
						Port:     pulumi.Int(80),
						Protocol: pulumi.String("TCP"),
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
