# Build containers locally
build:
	docker-compose build

# Build and run containers locally
run: build
	docker-compose up

# Stop running containers
stop:
	-docker ps | tail -n +2 | cut -d ' ' -f 1 | xargs docker kill
