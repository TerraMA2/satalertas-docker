#!/bin/bash

eval $(egrep -v '^#' .env | xargs)

DATE=$(date +%d-%m-%Y-%H-%M)

echo ""
echo "*********************"
echo "* Backup SatAlertas *"
echo "*********************"
echo ""

if test -d "/var/lib/docker/volumes/${COMPOSE_PROJECT_NAME}_satalertas_documents_vol/_data/"; then
    mkdir -vp ${BACKUP_DIR}/satalertas

    cd /var/lib/docker/volumes/${COMPOSE_PROJECT_NAME}_satalertas_documents_vol/_data/

    tar cvf - *.pdf | gzip -9 - > ${BACKUP_DIR}/satalertas/satalertas_documents-${DATE}.tar.gz
fi