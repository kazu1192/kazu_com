#!/bin/sh

echo '*create database*'

docker-compose run web rails db:create
docker-compose run web rails db:migrate
docker-compose run web rails db:seed
