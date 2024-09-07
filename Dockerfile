FROM node:21.0-bookworm-slim
COPY graphserver.js .
COPY package.json .
COPY UScities.json .
FROM alpine:3.20.3
RUN npm install &&\
    apk update &&\
    apk upgrade
RUN apk add libcrypto3=3.1.4-r0
EXPOSE  4000
CMD node graphserver.js
