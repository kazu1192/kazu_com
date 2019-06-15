# Railsをdocker-composeで構築するまで

- 上から順に編集、実行しました。
- 実行権限は環境によって置き換えること。(環境によってはsudo必須)

# 要点
- Rails, Vue.js + Webpack は完全に分離
- Webpackで結合したJavascriptファイルをapp/assets/javascripts以下に配置、
- Railsの javascript_include_tag で Vue.js を読み込む

## Railsの導入

### Dockerfile
```
FROM ruby:2.6-alpine

ENV RUNTIME_PACKAGES="linux-headers libxml2-dev libxslt-dev make gcc libc-dev nodejs yarn git tzdata postgresql-dev postgresql" \
    DEV_PACKAGES="build-base curl-dev" \
    HOME="/kazu_com"

WORKDIR $HOME

ADD Gemfile $HOME/Gemfile
ADD Gemfile.lock $HOME/Gemfile.lock

RUN apk update && \
    apk upgrade

RUN apk add --update --no-cache $RUNTIME_PACKAGES && \
    apk add --update --virtual build-dependencies --no-cache $DEV_PACKAGES && \
    bundle install -j4 && \
    apk del build-dependencies

ADD . $HOME
```
### docker-compose
```
version: '3'

services:
  db:
    image: postgres:latest
  web:
    build: .
    command: bundle exec rails s -p 3000 -b '0.0.0.0'
    volumes:
      - .:/kazu_com
    ports:
      - "3000:3000"
    depends_on:
      - db
```
### Gemfile
```
source 'https://rubygems.org'
gem 'rails', '5.2.2'
```
### 実行
```
$ docker-compose run web rails new . --api --database=postgresql --skip-test
$ sudo chown -R $USER:$USER .
```
### config/database.yml
```
# 該当部分を変更、追加
default: &default
  adapter: postgresql
  encoding: unicode
  host: db           # 追記
  username: postgres # 追記
  password:          # 追記
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
```
### 実行
```
$ docker-compose build
$ docker-compose run web rails db:create
$ docker-compose up -d
$ sudo chown -R $USER:$USER .
```
## Vue.jsによるフロントエンド環境の作成

### 実行
```
$ npm install -g npm
$ mkdir frontend
$ mkdir frontend/src
$ npm install -S vue
$ npm install -D vue-loader vue-template-compiler
$ npm install -D webpack webpack-cli webpack-dev-server
$ npm install -D @babel/core @babel/preset-env babel-loader
$ npm install -D sass-loader node-sass style-loader css-loader
```
### frontend/package.json
```
# 以下を追加
  "scripts": {
    "start": "webpack-dev-server",
    "build": "webpack -p"
  }
```
以上
