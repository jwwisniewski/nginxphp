composer-update:
	docker run --rm -it -v ${PWD}:/app composer update

composer-require:
	docker run --rm -it -v ${PWD}:/app composer require $(package)

composer-remove:
	docker run --rm -it -v ${PWD}:/app composer remove $(package)

composer-install:
	docker run --rm -it -v ${PWD}:/app composer install

composer-create-web:
	docker run --rm -it -v ${PWD}:/app composer create-project symfony/website-skeleton nginx

composer-create:
	docker run --rm -it -v ${PWD}:/app composer create-project symfony/skeleton nginx

up:
	docker-compose up -d

down:
	docker-compose down

console:
	docker-compose exec php bash

composer:
	docker-compose exec composer bash
