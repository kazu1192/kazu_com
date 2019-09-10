FROM node:12.10-alpine

ENV RUNTIME_PACKAGES="linux-headers libxml2-dev libxslt-dev bash make gcc libc-dev tzdata" \
    DEV_PACKAGES="build-base curl curl-dev" \
    HOME="/app"

WORKDIR $HOME

COPY package.json $HOME/package.json

RUN apk update && \
    apk add --update --no-cache $RUNTIME_PACKAGES && \
    apk add --update --virtual build-dependencies --no-cache $DEV_PACKAGES && \
    curl -o- -L https://yarnpkg.com/install.sh | sh && \
    apk del build-dependencies

RUN yarn

COPY . $HOME
