#!/bin/bash

docker volume create jenkins_home
docker network create admin_net

docker run --name=jenkins -d --privileged --restart=always -v jenkins_home:/var/jenkins_home --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock -v $(which docker):$(which docker) --network admin_net -p 36062:8080 jenkins/jenkins:jdk11
