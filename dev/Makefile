build-local:
	docker-compose build

run: build-local
	docker-compose up

stop:
	-docker ps | tail -n +2 | cut -d ' ' -f 1 | xargs docker kill

reset:
	-docker ps -a | tail -n +2 | cut -d ' ' -f 1 | xargs docker rm
	-docker images | tail -n +2 | tr -s ' ' | cut -d ' ' -f 3 | xargs docker rmi --force
