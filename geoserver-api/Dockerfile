FROM node:14-alpine

WORKDIR /app

RUN apk add git bash && \
    git clone -b b1.0.0 -o upstream https://github.com/TerraMA2/geoserver-api.git . && \
    npm install --production

ENV NODE_ENV=production

EXPOSE 3300

ENTRYPOINT ["npm", "run", "prod"]
