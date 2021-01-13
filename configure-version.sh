#!/bin/bash

echo "****************************"
echo "* Configuring config files *"
echo "****************************"
echo ""

# To debug each command, uncomment next line
# set -x

# Expand variables defined in file ".env" to current script execution
if [ ! -e ".env" ]
then
      cp .env.example .env
fi
eval $(egrep -v '^#' .env | xargs)

for image in server/config.json.in \
             server/Dockerfile.in \
             server/geoserver-conf/config.json.in \
             client/config/environment.prod.ts.in \
             client/Dockerfile.in; do
  sed -r \
        -e 's!%%COMPOSE_PROJECT_NAME%%!'"${COMPOSE_PROJECT_NAME}"'!g' \
        -e 's!%%TERRAMA2_DOCKER_REGISTRY%%!'"${TERRAMA2_DOCKER_REGISTRY}"'!g' \
        -e 's!%%TAG%%!'"${TAG}"'!g' \
        -e 's!%%BRANCH%%!'"${BRANCH}"'!g' \
        -e 's!%%PROTOCOL%%!'"${PROTOCOL}"'!g' \
        -e 's!%%BASE_PATH%%!'"${BASE_PATH}"'!g' \
        -e 's!%%CLIENT_PORT%%!'"${CLIENT_PORT}"'!g' \
        -e 's!%%SERVER_PORT%%!'"${SERVER_PORT}"'!g' \
        -e 's!%%POSTGRES_DATABASE%%!'"${POSTGRES_DATABASE}"'!g' \
        -e 's!%%SERVER_URI%%!'"${SERVER_URI}"'!g' \
        -e 's!%%GEOSERVER_URI%%!'"${GEOSERVER_URI}"'!g' \
        -e 's!%%TERRAMA2_URI%%!'"${TERRAMA2_URI}"'!g' \
        -e 's!%%BACKUP_DIR%%!'"${BACKUP_DIR}"'!g' \
      "${image}" > "${image::-3}"
done
