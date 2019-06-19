# Rails + Vue.jsをdocker-composeで構築するまで

- 上から順に編集、実行しました。
- 実行権限は環境によって置き換えること。(環境によってはsudo必須)
- Rails(API) と Vue.js + Webpack は完全に分離

## Railsの導入

### Dockerfile

```Dockerfile
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

### docker-compose.yml

```yaml
version: '3'

services:
  db:
    image: mongo:4.1-bionic
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

```Ruby
source 'https://rubygems.org'
gem 'rails', '5.2.2'
```

### 実行

```
$ docker-compose run web rails new . --api --skip-active-record --skip-test
$ sudo chown -R $USER:$USER .
```

[Gemfile に gem 'mongoid', gem 'rspec-rails', gem 'faker' を追加](./backend/Gemfile)

```
$ docker-compose build
$ docker-compose run web rails g mongoid:config
$ docker-compose run web rails db:create
$ docker-compose up -d
$ sudo chown -R $USER:$USER .
```

## Vue.jsによるフロントエンド環境の作成

(@vue/cli を使用して環境作るのがいいかと思います。)

### 実行

```
$ npm install -g npm
$ mkdir frontend
$ mkdir frontend/src
```

[参照](./frontend/package.json)
```
$ npm install -S vue
$ npm install -D vue-loader vue-template-compiler
$ npm install -D webpack webpack-cli webpack-dev-server
$ npm install -D @babel/core @babel/preset-env babel-loader
$ npm install -D sass-loader node-sass style-loader css-loader
$ npm install -D postcss postcss-loader autoprefixer mini-css-extract-plugin
$ npm install -D pug pug-plain-loader es6-promise eslint eslint-loader cross-env
```

### webpack.config.js

[参照](./frontend/webpack.config.js)

### package.json

```json
# 以下を追加
  "scripts": {
    "start": "webpack-dev-server --hot --inline",
    "build:dev": "cross-env NODE_ENV=development webpack --progress",
    "build:pro": "cross-env NODE_ENV=production webpack --progress"
  }
```

以上
