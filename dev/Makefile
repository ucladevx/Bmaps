# Build containers locally
build:
	docker-compose build

# Build and run containers locally
run: build
	docker-compose up

# Run frontend by entering container with `make front` and then running
# `make files` from the Makefile within the frontend container
# If folder or container names change, use `docker ps` to get right container name
front:
	docker exec -it dev_web_nginx_1 /bin/ash

# Stop running containers
stop:
	-docker ps | tail -n +2 | cut -d ' ' -f 1 | xargs docker kill
