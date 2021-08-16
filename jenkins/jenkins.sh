#!/bin/bash

cd jenkins || exit

docker network create jenkins

docker build -t jenkins/jenkins:jdk11 .

docker run --name jenkins -d --privileged --restart=always -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):$(which docker) --network jenkins -p 36001:8080 jenkins/jenkins:jdk11
