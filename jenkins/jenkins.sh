#!/bin/bash

CURRENT_FOLDER=$(basename $(pwd))
if [ ! "$CURRENT_FOLDER" == 'jenkins' ] ; then
  cd jenkins || exit
fi

docker network create jenkins

docker run --name jenkins -d --privileged --restart=always -v jenkins_home:/var/jenkins_home --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock -v $(which docker):$(which docker) --network jenkins -p 36001:8080 jenkins/jenkins:jdk11
