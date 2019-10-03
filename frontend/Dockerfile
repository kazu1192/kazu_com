FROM node:lts-alpine

RUN apk update && \
  apk add git && \
  apk add --no-cache curl && \
  curl -o- -L https://yarnpkg.com/install.sh | sh

# カレントワーキングディレクトリとして 'app' フォルダを指定する
WORKDIR /app

# `package.json` と `package-lock.json` （あれば）を両方コピーする
COPY package.json ./
COPY yarn.lock ./

# プロジェクトの依存ライブラリをインストールする
RUN yarn install

# カレントワーキングディレクトリ(つまり 'app' フォルダ)にプロジェクトのファイルやフォルダをコピーする
COPY . .

# 本番向けに圧縮しながらアプリケーションをビルドする
RUN yarn run build:dev

EXPOSE 8080
CMD [ "yarn", "start" ]
