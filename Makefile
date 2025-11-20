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

ping:
	curl localhost:8181/v1/data

pingme:
	curl  -X POST localhost:8181/v1/data -H "Content-Type: application/json" -d '{"first_name":"Jim","last_name":"McGaw"}'


hello:
	opa eval "data.hello.message" -d hello.rego

message:
	opa eval "data.hello.message" -i '{"name": "OPA"}' -d hello.rego

admin:	
	opa eval "data.authz.is_admin" -i admin_user.json -d is_admin.rego

readonly:	
	opa eval "data.authz.is_admin" -i nonadmin_user.json -d is_admin.rego

internal:
	opa eval "data.authz.is_internal" -i internal_user.json -d is_admin.rego

external:
	opa eval "data.authz.is_internal" -i external_user.json -d is_admin.rego