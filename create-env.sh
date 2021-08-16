#!/bin/bash

echo "********************"
echo "* Create .env file *"
echo "********************"
echo ""

if [ ! -e ".env" ]
then
      cp .env.example .env
fi

TAG=$1
COMPOSE_PROJECT_NAME=$2
PROTOCOL=$3
BASE_PATH=$4
BASE_URL=$5

sed -i "/TAG/cTAG=${TAG}" .env
sed -i "/COMPOSE_PROJECT_NAME/cCOMPOSE_PROJECT_NAME=${COMPOSE_PROJECT_NAME}" .env
sed -i "/PROTOCOL/cPROTOCOL=${PROTOCOL}" .env
sed -i "/BASE_PATH/cBASE_PATH=${BASE_PATH}" .env
sed -i "/GEOSERVER_URI/cGEOSERVER_URI=${PROTOCOL}${BASE_URL}${BASE_PATH}geoserver" .env
