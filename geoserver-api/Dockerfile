FROM node:14-alpine

WORKDIR /app

ENV NODE_ENV=production

RUN apk add git bash && \
    git clone -b b1.0.0 -o upstream https://github.com/TerraMA2/geoserver-api.git . && \
    npm ci --only=production --silent

ENTRYPOINT ["npm", "run", "prod"]
