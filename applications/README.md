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
* [Web Arena Game on App Service](https://github.com/locallybuild/example-app-service-arena-game) - a browser-based arena game provisioned to App Service.

## Container Instances

* [Redis-backed app on Container Instances](https://github.com/locallybuild/example-container-instance-redis) - an app running in a Container Instance that reads from and writes to Redis.
* [SAML-powered CRM on Container Instances](https://github.com/locallybuild/example-container-instance-saml) - a SAML-based CRM application deployed to a Container Instance.

## Functions

* [Event Grid triggered Function App](https://github.com/locallybuild/example-eventgrid-triggered-function-app) - a Function App triggered by Event Grid whenever resources are provisioned.

## CI

* [Running Locally in GitHub Actions](https://github.com/locallybuild/example-github-actions) - an example of using Locally within a GitHub Actions workflow.
