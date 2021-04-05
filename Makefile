start:
	php artisan serve --host 0.0.0.0

install:
	composer install
	cp -n .env.example .env || true
	php artisan key:gen --ansi
	php artisan migrate:fresh --seed

watch:
	npm run watch

migrate:
	php artisan migrate

console:
	php artisan tinker

log:
	tail -f storage/logs/laravel.log

test:
	php artisan test

deploy:
	git push heroku

lint:
	composer exec phpcs app tests routes

lint-fix:
	composer exec phpcbf

compose-install:
	docker-compose run application make install
	docker-compose run frontend npm ci

compose-start:
	docker-compose up --abort-on-container-exit

compose-setup: compose-down compose-build compose-install

compose-build:
	docker-compose build

compose-down:
	docker-compose down || true

compose-stop:
	docker-compose stop || true

compose-restart:
	docker-compose restart

compose-bash:
	docker-compose application run bash
