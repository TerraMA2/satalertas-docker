#!/bin/bash

echo "***********************"
echo "* Building SatAlertas *"
echo "***********************"
echo ""

eval $(egrep -v '^#' .env | xargs)

./build-images.sh

./push.sh

docker-compose -f docker-compose.yml -p ${COMPOSE_PROJECT_NAME} down

docker-compose -f docker-compose.yml -p ${COMPOSE_PROJECT_NAME} pull

docker-compose -f docker-compose.yml -p ${COMPOSE_PROJECT_NAME} up -d

service nginx reload