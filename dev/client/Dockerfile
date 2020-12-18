FROM node:14

ENV SATALERTAS_USER=satalertas

RUN npm install -g @angular/cli@11 && \
    apt update && \
    apt install sudo && \
    groupadd $SATALERTAS_USER && \
    useradd $SATALERTAS_USER -s /bin/bash -m -g $SATALERTAS_USER && \
    echo $SATALERTAS_USER:$SATALERTAS_USER | chpasswd && \
    mkdir /home/$SATALERTAS_USER/app && \
    chown -R $SATALERTAS_USER:$SATALERTAS_USER /home/$SATALERTAS_USER && \
    chmod -R g-w /home/$SATALERTAS_USER && \
    echo "${SATALERTAS_USER} ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers

USER ${SATALERTAS_USER}
