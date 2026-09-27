package main

import (
	"github.com/pulumi/pulumi-azure-native-sdk/resources/v3"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		_, err := resources.NewResourceGroup(ctx, "pulumi-native-resource-group", &resources.ResourceGroupArgs{
			Location: pulumi.String("berlin"),
		})
		if err != nil {
			return err
		}

		return nil
	})
}
