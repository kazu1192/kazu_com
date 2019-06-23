FROM ruby:2.6-alpine

ENV RUNTIME_PACKAGES="linux-headers libxml2-dev libxslt-dev bash make gcc libc-dev nodejs yarn tzdata mysql-client mysql-dev" \
    DEV_PACKAGES="build-base curl curl-dev" \
    HOME="/app"

WORKDIR $HOME

COPY Gemfile $HOME/Gemfile
COPY Gemfile.lock $HOME/Gemfile.lock

RUN apk update && \
    apk add --update --no-cache $RUNTIME_PACKAGES && \
    apk add --update --virtual build-dependencies --no-cache $DEV_PACKAGES && \
    apk del build-dependencies

RUN gem install bundler && \
    bundle install -j4

COPY . $HOME
