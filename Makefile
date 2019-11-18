p ?=

ci:
	docker-compose exec phpfpm composer install

crq:
	docker-compose exec phpfpm composer require $(p)

cu:
	docker-compose exec phpfpm composer update $(p)

crm:
	docker-compose exec phpfpm composer remove $(p)

cda:
	docker-compose exec phpfpm composer dump-autoload

up:
	docker-compose up -d --remove-orphans

down:
	docker-compose down --remove-orphans

console:
	docker-compose exec phpfpm bash

unit-up:
	docker-compose -f docker-compose-test.yml up -d

unit-down:
	docker-compose -f docker-compose-test.yml down --volumes || \
	docker-compose -f docker-compose-test.yml down --volumes

unit-run: unit-up
	docker-compose -f docker-compose-test.yml exec -e APP_ENV=test phpfpm_test \
		php bin/console doctrine:migrations:migrate --no-interaction
	docker-compose -f docker-compose-test.yml exec -e APP_ENV=test phpfpm_test \
		php bin/console doctrine:fixtures:load --no-interaction
	docker-compose -f docker-compose-test.yml exec -e APP_ENV=test phpfpm_test \
		php bin/phpunit

tests: unit-run unit-down
