FROM node:8.9
MAINTAINER Jonathon W. Marshall <jonathon@symbilityintersect.com>

EXPOSE 3000

WORKDIR /srv/app

COPY package.json       package.json
COPY package-lock.json  package-lock.json
COPY server.js          server.js

RUN npm install

CMD node server.js
