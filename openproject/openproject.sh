docker volume create openproject_pgdata_vol
docker volume create openproject_assets_vol
docker network create --scope swarm --attachable admin_net

docker service create --name openproject \
  --publish 36061:80 \
  --hostname=portainer \
  --network admin_net \
  --restart-condition=on-failure \
  --restart-max-attempts=2 \
  --env OPENPROJECT_RAILS__RELATIVE__URL__ROOT=/openproject \
  --env SERVER_HOSTNAME=www.terrama2.dpi.inpe.br \
  --env SECRET_KEY_BASE=4KqlgDfj9od8Jkc8TILnOV1RkN9OBb8N \
  --mount type=volume,src=openproject_pgdata_vol,dst=/var/openproject/pgdata \
  --mount type=volume,src=openproject_assets_vol,dst=/var/openproject/assets openproject/community:11
