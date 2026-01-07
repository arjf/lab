docker compose --env-file ./psql.env -f ./docker-compose.yaml down
rm -rf /var/lib/postgresql/data
docker compose --env-file ./psql.env -f ./docker-compose.yaml up -d
docker compose -f ./docker-compose.yaml logs -f
