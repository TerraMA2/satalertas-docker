#!/bin/bash

docker volume create portainer_data
docker network create admin_net

docker run --name=portainer -d --privileged --restart=always -p 36060:9000 --network admin_net --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:alpine

#docker run -d -p 36061:9001 --name portainer_agent --restart=always --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock -v /var/lib/docker/volumes:/var/lib/docker/volumes portainer/agent:alpine
