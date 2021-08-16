#!/bin/bash

echo "******************************"
echo "* Building SatAlertas images *"
echo "******************************"
echo ""

function is_valid() {
  local code=$1
  local err_msg=$2

  if [ $1 -ne 0 ]; then
    echo ${err_msg}
    exit ${code}
  fi
}

CURRENT_FOLDER=$(basename $(pwd))
if [ "$CURRENT_FOLDER" == 'scripts' ] ; then
  cd ..
fi

# Variables
eval $(egrep -v '^#' .env | xargs)

# SatAlertas server
docker build --rm --no-cache --tag ${TERRAMA2_DOCKER_REGISTRY}/${COMPOSE_PROJECT_NAME}-satalertas-server:${VERSION} server
is_valid $? "Could not build SatAlertas server image"

# SatAlertas client
docker build --rm --no-cache --tag ${TERRAMA2_DOCKER_REGISTRY}/${COMPOSE_PROJECT_NAME}-satalertas-client:${VERSION} client
is_valid $? "Could not build SatAlertas client image"
