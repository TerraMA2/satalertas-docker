#!/bin/bash

echo "********************"
echo "* Create .env file *"
echo "********************"
echo ""

CURRENT_FOLDER=$(basename $(pwd))
if [ "$CURRENT_FOLDER" == 'scripts' ] ; then
  cd ..
fi

if [ ! -e ".env" ]
then
      cp .env.example .env
fi

VERSION=$1
COMPOSE_PROJECT_NAME=$2
PROJECT_ID=$3
BASE_PATH=$4
BASE_URL=$5

sed -i "/VERSION/cVERSION=${VERSION}" .env
sed -i "/COMPOSE_PROJECT_NAME/cCOMPOSE_PROJECT_NAME=${COMPOSE_PROJECT_NAME}" .env
sed -i "/PROJECT_ID/cPROJECT_ID=${PROJECT_ID}" .env
sed -i "/BASE_PATH/cBASE_PATH=${BASE_PATH}" .env
sed -i "/BASE_URL/cBASE_URL=${BASE_URL}" .env
sed -i "/BACKUP_DIR/cBACKUP_DIR=/data/backup/${COMPOSE_PROJECT_NAME}" .env
