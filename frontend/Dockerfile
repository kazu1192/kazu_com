FROM node:lts-alpine

RUN apk update && \
    apk add git

WORKDIR /app

COPY package.json ./
COPY yarn.lock ./
RUN npm install yarn -g
RUN yarn install
COPY . .

EXPOSE 8080
CMD [ "yarn", "start" ]
