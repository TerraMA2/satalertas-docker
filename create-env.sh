#!/bin/bash

if [ ! -e ".env" ]
then
      cp .env.example .env
fi

TAG=$1
COMPOSE_PROJECT_NAME=$2
PROJECT_ID=$3
PROTOCOL=$4
BASE_PATH=$5
BASE_URL=$6

sed -i "/TAG/cTAG=${TAG}" .env
sed -i "/COMPOSE_PROJECT_NAME/cCOMPOSE_PROJECT_NAME=${COMPOSE_PROJECT_NAME}" .env
sed -i "/PROJECT_ID/cPROJECT_ID=${PROJECT_ID}" .env
sed -i "/PROTOCOL/cPROTOCOL=${PROTOCOL}" .env
sed -i "/BASE_PATH/cBASE_PATH=${BASE_PATH}" .env
sed -i "/BACKEND_URI/cBACKEND_URI=${PROTOCOL}${BASE_URL}${BASE_PATH}alertaServer" .env
sed -i "/GEOSERVER_URI/cGEOSERVER_URI=${PROTOCOL}${BASE_URL}${BASE_PATH}geoserver" .env
sed -i "/TERRAMA2_URI/cTERRAMA2_URI=${PROTOCOL}${BASE_URL}${BASE_PATH}adm" .env
