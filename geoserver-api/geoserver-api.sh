#!/bin/bash

docker service create --name=geoserver-api -d \
                      --hostname=geoserver-api \
                      --restart-condition=on-failure \
                      --restart-max-attempts=2 \
                      --config geoserver_api_config \
                      --publish 36063:3300 terrama2/geoserver-api:1.0.0
