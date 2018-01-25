build-local:
	docker-compose build

run: build-local
	docker-compose up

stop:
	-docker ps | tail -n +2 | cut -d ' ' -f 1 | xargs docker kill

# `docker ps` to make sure you get right NAME (folder + container name?)
# Enter container and then run `make files` which is within frontend container
nginx_ash:
	docker exec -it dev_web_nginx_1 /bin/ash
