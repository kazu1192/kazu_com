#!/bin/sh

echo '*database create, migrate, seed*'

docker-compose run rails_app bin/rails db:create
docker-compose run rails_app bin/rails db:migrate
docker-compose run rails_app bin/rails db:seed
