#!/bin/bash

docker volume create portainer_data

docker run -d -p 36010:9000 --name=portainer --restart=always --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:alpine -H unix:///var/run/docker.sock

docker run -d -p 36011:9001 --name portainer_agent --restart=always --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock -v /var/lib/docker/volumes:/var/lib/docker/volumes portainer/agent:alpine -H unix:///var/run/docker.sock