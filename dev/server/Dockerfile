FROM node:12

ENV SATALERTAS_USER=satalertas
ENV NODE_ENV=development

RUN npm install -g @angular/cli@11 && \
    apt update && \
    apt install sudo && \
    groupadd $SATALERTAS_USER && \
    useradd $SATALERTAS_USER -s /bin/bash -m -g $SATALERTAS_USER && \
    echo $SATALERTAS_USER:$SATALERTAS_USER | chpasswd && \
    mkdir /home/$SATALERTAS_USER/app && \
    chown -R $SATALERTAS_USER:$SATALERTAS_USER /home/$SATALERTAS_USER && \
    chmod g-w /home/$SATALERTAS_USER && \
    echo "${SATALERTAS_USER} ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers

RUN apt-get update && \
    apt-get install -y gdal-bin zip nano && \
    npm install -g nodemon

USER ${SATALERTAS_USER}
