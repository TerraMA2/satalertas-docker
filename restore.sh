#!/bin/bash

eval $(egrep -v '^#' .env | xargs)

echo ""
echo "********************"
echo "* Restore SatAlertas *"
echo "********************"

if test -d "/var/lib/docker/volumes/${COMPOSE_PROJECT_NAME}_satalertas_documents_vol/_data/"; then
    cd ${BACKUP_DIR}/satalertas

    latestDocumentBackupFile=$(ls -t1 | head -n 1)
    
    echo ""
    echo "*********************"
    echo "* Removing old data *"
    echo "*********************"
    echo ""

    rm -vrf /var/lib/docker/volumes/${COMPOSE_PROJECT_NAME}_satalertas_documents_vol/_data/*

    echo ""
    echo "**************"
    echo "* Extracting *"
    echo "**************"
    echo ""

    tar xvf ${latestDocumentBackupFile} -C /var/lib/docker/volumes/${COMPOSE_PROJECT_NAME}_satalertas_documents_vol/_data/
fi