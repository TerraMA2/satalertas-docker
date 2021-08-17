#!/bin/bash

echo "****************************"
echo "* Configuring config files *"
echo "****************************"
echo ""

CURRENT_FOLDER=$(basename $(pwd))
if [ "$CURRENT_FOLDER" == 'scripts' ] ; then
  cd ..
fi

if [ ! -e ".env" ]; then
      cp .env.example .env
fi

eval $(egrep -v '^#' .env | xargs)

for file in server/config.json.in \
              docker-compose.yml.in \
              server/Dockerfile.in \
              server/geoserver-conf/config.json.in \
              client/Dockerfile.in \
              client/config/nginx.conf.in; do
  sed -r \
        -e 's!%%COMPOSE_PROJECT_NAME%%!'"${COMPOSE_PROJECT_NAME}"'!g' \
        -e 's!%%PROJECT_ID%%!'"${PROJECT_ID}"'!g' \
        -e 's!%%TERRAMA2_DOCKER_REGISTRY%%!'"${TERRAMA2_DOCKER_REGISTRY}"'!g' \
        -e 's!%%VERSION%%!'"${VERSION}"'!g' \
        -e 's!%%BASE_PATH%%!'"${BASE_PATH}"'!g' \
        -e 's!%%CLIENT_PORT%%!'"${CLIENT_PORT}"'!g' \
        -e 's!%%SERVER_PORT%%!'"${SERVER_PORT}"'!g' \
        -e 's!%%POSTGRES_DATABASE%%!'"${POSTGRES_DATABASE}"'!g' \
        -e 's!%%BACKUP_DIR%%!'"${BACKUP_DIR}"'!g' \
        -e 's!%%QUICKCHART_PORT%%!'"${QUICKCHART_PORT}"'!g' \
      "${file}" > "${file::-3}"
done