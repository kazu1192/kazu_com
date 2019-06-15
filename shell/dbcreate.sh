#!/bin/sh

echo '*create database*'

docker-compose run rails rails db:create
docker-compose run rails rails db:migrate
docker-compose run rails rails db:seed
