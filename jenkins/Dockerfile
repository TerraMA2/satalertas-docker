FROM jenkins/jenkins:jdk11

USER root

RUN groupadd docker && \
    usermod -aG docker jenkins && \
    newgrp docker

USER jenkins
