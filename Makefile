composer-update:
	docker run --rm -it -v ${PWD}/nginxphp:/app composer update

composer-install:
	docker run --rm -it -v ${PWD}/nginxphp:/app composer install

composer-create-web:
	docker run --rm -it -v ${PWD}:/app composer create-project symfony/website-skeleton nginxphp

composer-create:
	docker run --rm -it -v ${PWD}:/app composer create-project symfony/skeleton nginxphp

up:
	docker-compose up -d

down:
	docker-compose down

console:
	docker-compose exec php bash