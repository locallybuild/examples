```
ooooo                                      oooo  oooo              
`888'                                      `888  `888              
 888          .ooooo.   .ooooo.   .oooo.    888   888  oooo    ooo 
 888         d88' `88b d88' `\"Y8 `P  )88b   888   888   `88.  .8'
 888         888   888 888        .oP\"888   888   888    `88..8'
 888       o 888   888 888   .o8 d8(  888   888   888     `888'
o888ooooood8 `Y8bod8P' `Y8bod8P' `Y888\"\"8o o888o o888o     .8'
                                                       .o..P'
                                                       `Y8P'
```

# Example Applications using Locally

This directory links to complete, end-to-end example applications running on [Locally](https://locally.build).

Unlike the other examples in this repository, which each focus on provisioning a single resource with a given tool, these show a whole application (infrastructure and code together) running against Locally. Each one lives in its own repository.

## App Service

* [App Configuration-backed app on App Service](https://github.com/locallybuild/example-app-service-app-configuration) - an app deployed to App Service that reads its settings from App Configuration.
* [Cosmos DB-backed app on App Service](https://github.com/locallybuild/example-app-service-cosmosdb) - a TypeScript app deployed to App Service that writes to Cosmos DB.
* [MySQL-backed app on App Service](https://github.com/locallybuild/example-app-service-mysql) - a Python app deployed to App Service that works with MySQL.
* [PostgreSQL-backed app on App Service](https://github.com/locallybuild/example-app-service-postgresql) - an app deployed to App Service that writes to PostgreSQL.
* [WordPress on App Service](https://github.com/locallybuild/example-app-service-wordpress) - WordPress running on App Service, backed by MySQL.
* [SAML-powered CRM on App Service](https://github.com/locallybuild/example-app-service-saml) - a SAML-based CRM application deployed to App Service.
* [Web Arena Game on App Service](https://github.com/locallybuild/example-app-service-arena-game) - a browser-based arena game provisioned to App Service.
* [.NET Aspire app on App Service](https://github.com/locallybuild/example-app-service-aspire) - a .NET Aspire guestbook deployed to App Service using the Bicep Aspire generates, with Blob Storage, Queue Storage and Azure Managed Redis.
* [MassTransit saga on App Service](https://github.com/locallybuild/example-app-service-masstransit) - two .NET apps talking through MassTransit over Service Bus, with the saga's state in Azure Cache for Redis.
* [Regional failover on App Service](https://github.com/locallybuild/example-app-service-multi-region) - a .NET orders API with Blob Storage and Service Bus in two regions, for testing failover with Chaos Engineering.
* [Key Vault secrets on App Service](https://github.com/locallybuild/example-app-service-key-vault) - an app that reads a Key Vault secret through a Key Vault reference and directly with the SDK, using a managed identity.
* [App Service Authentication (EasyAuth)](https://github.com/locallybuild/example-app-service-easyauth) - a Python app on App Service that signs users in with App Service Authentication against the Directory Emulator.
* [Deployment slots on App Service](https://github.com/locallybuild/example-app-service-deployment-slots) - a blue/green deployment using a staging slot and a slot swap.
* [Service Bus and Table Storage on App Service](https://github.com/locallybuild/example-app-service-servicebus) - a producer and a consumer passing messages through a Service Bus queue into Table Storage, each with its own managed identity.
* [Event Hubs on App Service](https://github.com/locallybuild/example-app-service-eventhub) - a producer and a consumer streaming telemetry through Event Hubs, with checkpoints in Blob Storage.
* [Azure Monitor alerts from App Service](https://github.com/locallybuild/example-app-service-alerts) - an app whose failed requests fire a log search alert, which an Action Group posts to a webhook on a second app.

## Container Apps

* [Web Arena Game on Container Apps](https://github.com/locallybuild/example-container-apps-arena-game) - a browser-based arena game deployed to Container Apps, with its leaderboard on a mounted Azure Files share.

## Container Instances

* [Redis-backed app on Container Instances](https://github.com/locallybuild/example-container-instance-redis) - an app running in a Container Instance that reads from and writes to Redis.
* [SAML-powered CRM on Container Instances](https://github.com/locallybuild/example-container-instance-saml) - a SAML-based CRM application deployed to a Container Instance.

## Functions

* [Event Grid triggered Function App](https://github.com/locallybuild/example-eventgrid-triggered-function-app) - a Function App triggered by Event Grid whenever resources are provisioned.
* [Durable Functions on a Durable Task Scheduler](https://github.com/locallybuild/example-durable-function-app) - a .NET Durable Functions app using a Durable Task Scheduler as its backend.
* [Service Bus triggered Function App](https://github.com/locallybuild/example-function-app-servicebus-trigger) - a Function App that sends messages to Service Bus, picks them up with a Service Bus trigger and stores them in Table Storage.
* [URL shortener on a Function App and App Service](https://github.com/locallybuild/example-function-app-url-shortener) - a .NET URL shortener with a Function App serving the links and an admin site on App Service, backed by PostgreSQL.

## API Management

* [Function Apps behind API Management](https://github.com/locallybuild/example-api-management-function-apps) - two Function Apps behind one API Management gateway, with a subscription key, a rate limit and function keys added by the gateway.
* [API Management backends](https://github.com/locallybuild/example-api-management-backends) - two Function Apps and a Web App behind API Management, using backends that add each app's credential.
* [GraphQL APIs behind API Management](https://github.com/locallybuild/example-api-management-graphql) - two GraphQL Function Apps and an HTML storefront behind API Management, which validates each operation against the schema.

## Event Grid

* [Event Grid webhook consumer in Go](https://github.com/locallybuild/example-eventgrid-consumer) - a Go webhook that receives events from an Event Grid custom topic and a system topic.

## CI

* [Running Locally in GitHub Actions](https://github.com/locallybuild/example-github-actions) - an example of using Locally within a GitHub Actions workflow.
