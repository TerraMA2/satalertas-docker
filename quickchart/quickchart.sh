#!/bin/bash

docker service create --name=quickchart -d \
                      --hostname=quickchart \
                      --restart-condition=on-failure \
                      --restart-max-attempts=2 \
                      --publish 36064:3400 ianw/quickchart:v1.5.0
