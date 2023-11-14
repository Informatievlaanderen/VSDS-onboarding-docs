---
title: Configuring the LDES server
layout: home
nav_order: 0
---

# Configuring the LDES server

## File directory layout


    ├─── proxy
    |
    ├─── poller (if necessary)
    |
    ├─── server
    |
    ├─── workbench
    |
    ├─── docker-compose.yml



## proxy

This directory contains configuration files or scripts related to the proxy server. A proxy server acts as an intermediary between users and the internet or between different parts of a network. It's often used for purposes like load balancing, security enhancements, or caching requests to improve performance.

## poller

This directpry includes files for a polling service or application. This poller regularly checks or queries a service, database, or other resources to see if there are any updates or changes. This is a common mechanism in systems that synchronize with other systems regularly.

## workbench

This directory includes everything necessary to set up the [LDES workbench or Linked Data Interaction](https://informatievlaanderen.github.io/VSDS-Linked-Data-Interactions/) .



# Setting Permissions for EPSG Database

{: .note }
If the data does not have a geo component, this step can be skipped.

For data encompassing geo-components like sites, points of interest (POIs), sensor locations, and similar elements, activation of the EPSG database environment is essential. This environment is essential for managing geospatial data and its related coordinate systems. Proper setup and configuration of this environment are vital for the smooth operation with geo-data.

Set correct permissions for the EPSG database location:

```bash
mkdir -p ./server/tmp/epsg
chmod -R 0777 ./server/tmp
chmod +x ./server/seed/*.sh
```

Now the necessary things have happened, we can move on.  


## Start LDES server





Second, we must create the docker yaml file to activate the ```LDES-server``` and its internal database ```ldes-mongodb```.


```yaml
version: '3.3'
services:

  ldes-mongodb:
    container_name: ${USECASE_NAME:-XXX-onboarding}_ldes-mongodb
    image: mongo:${MONGODB_TAG:-latest}
    ports:
      - ${MONGODB_PORT:-27017}:27017
    networks:
      - XXX

  ldio-workbench:
    container_name: ${USECASE_NAME:-XXX-onboarding}_ldio-workbench
    image: ldes/ldi-orchestrator:${LDI_ORCHESTRATOR_TAG:-1.9.0-SNAPSHOT}
    volumes:
      - ./workbench/config.yml:/ldio/application.yml:ro
      - ./workbench/sparql:/ldio/sparql:ro
      - ./workbench/jsonld:/ldio/jsonld:ro
    ports:
      - ${LDIO_WORKBENCH_PORT:-8081}:8080
    networks:
      - XXX 
    profiles:
      - delay-started

  ldes-server:
    container_name: ${USECASE_NAME:-XXX-onboarding}_ldes-server
    image: ldes/ldes-server:${LDES_SERVER_TAG:-2.3.0-SNAPSHOT}
    environment:
      - SIS_DATA=/tmp
    volumes:
      - ./server/config.yml:/application.yml:ro
      - ./server/tmp/epsg:/tmp/Databases:rw
    ports:
      - ${LDES_SERVER_PORT:-8082}:8080
    networks:
      - XXX
    depends_on:
      - ldes-mongodb

  nginx:
    image: nginx:${NGINX_TAG:-stable}
    container_name: ${USECASE_NAME:-XXX-onboarding}_nginx
    ports:
      - ${NGINX_PORT:-8080}:8080
    volumes:
      - ./proxy/nginx.passtrough.conf:/etc/nginx/conf.d/fwd-ldes-server.conf:ro
    depends_on:
      - ldes-server
    networks:
      - XXX

networks:
  XXX:
    name: ${USECASE_NAME:-XXX-onboarding}_network
```



Now, we can set up and manage a multi-container Docker application, specifically to set up the (LDES) server and related components.

By running this command, the docker container will be run:
```bash
docker compose up -d
```

This command starts up the services defined in the Docker Compose YAML file.
It looks at the docker-compose.yml file in the current directory (or the file specified with -f) to understand which containers and networks need to be created and how they are configured.
Several services are defined in the provided YAML file: ldes-mongodb, ldio-workbench, ldes-server, and nginx, each with specific configurations like container names, images, ports, volumes, and networks.