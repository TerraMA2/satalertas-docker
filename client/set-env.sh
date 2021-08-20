#!/bin/sh

cd /usr/share/nginx/html${BASE_PATH}alerta/ || exit
touch env.js
echo "(function (window) {
    window.__env = window.__env || {};
    window.__env.production = ${PRODUCTION};
    window.__env.project = '${PROJECT_ID}';
    window.__env.serverUrl = '${SERVER_URL}';
    window.__env.geoserverUrl = '${GEOSERVER_URL}';
}(this));" > env.js
