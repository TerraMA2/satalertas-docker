#!/bin/bash

eval $(egrep -v '^#' .env | xargs)

./configure-version.sh

docker-compose -p ${COMPOSE_PROJECT_NAME} up -d