package main

import (
	"github.com/pulumi/pulumi-azure/sdk/v6/go/azure/core"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		_, err := core.NewResourceGroup(ctx, "pulumi-resourcegroup", &core.ResourceGroupArgs{
			Location: pulumi.StringPtr("berlin"),
		})
		if err != nil {
			return err
		}

		return nil
	})
}
