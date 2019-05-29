# Login to AWS instance
ecr-login:
	sudo $(shell aws ecr get-login --no-include-email --region us-east-2)

# Deploy using the latest pushed images
deploy: ecr-login
	docker-compose pull
	docker-compose up

# See running Docker processes
ps:
	docker ps

# Get backend container ID
CONTAINER_ID := $(shell sudo docker ps -qf "name=backend")

check-id:
ifndef CONTAINER_ID
	$(error CONTAINER_ID is undefined.)
endif

# Follow backend logs
logs: check-id
	docker logs -f $(CONTAINER_ID)

# Enter interactive shell to backend container
sh: check-id
	docker exec -it $(CONTAINER_ID) bash
