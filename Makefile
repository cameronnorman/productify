setup: build bundle db_setup db_migrate db_seed

build:
	docker-compose build

bundle:
	docker-compose run --rm api bundle install

console:
	docker-compose run --rm api rails c

shell:
	docker-compose run --rm api ash

tests:
	docker-compose run --rm -e APPLICATION_ENV=test api rspec

db_seed:
	docker-compose run --rm api rails db:seed
	docker-compose run --rm api rails db:seed RAILS_ENV=test

db_migrate:
	docker-compose run --rm api rails db:migrate
	docker-compose run --rm api rails db:migrate RAILS_ENV=test

db_setup:
	docker-compose run --rm api rails db:setup
	docker-compose run --rm api rails db:setup RAILS_ENV=test

rubocop:
	docker-compose run --rm api rubocop -A

run:
	rm -f tmp/pids/server.pid
	docker-compose run --service-ports --rm api rails s -b 0.0.0.0

up:
	docker-compose up -d && docker-compose logs -f api

down:
	docker-compose down
