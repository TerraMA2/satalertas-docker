#!/bin/bash

CURRENT_FOLDER=$(basename $(pwd))
if [ "$CURRENT_FOLDER" == 'scripts' ] ; then
  cd ..
fi

rm -rf client/Dockerfile client/config/nginx.conf server/Dockerfile server/config.json server/geoserver-conf/config.json .env docker-compose.yml
