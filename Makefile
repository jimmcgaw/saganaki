build:
	docker compose build

start:
	docker compose up -d

stop:
	docker compose down

restart:
	docker compose down
	docker compose up -d

logs:
	docker compose logs opa -f

applogs:
	docker compose logs app -f

shell:
	docker compose exec opa opa run

test:
	opa test . -v

cov:
	opa test . -v --coverage