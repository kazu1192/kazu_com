FROM node:lts-alpine

RUN apk update && \
  apk add git && \
  apk add --no-cache curl && \
  curl -o- -L https://yarnpkg.com/install.sh | sh

WORKDIR /app

COPY package.json ./
COPY yarn.lock ./
RUN yarn install
COPY . .

EXPOSE 8080
CMD [ "yarn", "start" ]
