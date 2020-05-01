# Include Environment Variables from .env file
include .env

##################     				  LOCAL DEVELOPMENT 		    	   ##################

# Creates and runs a static production build of the Angular frontend. Runs
# Backend Flask API in separate container.
run:
	docker-compose up --build

# Stops the stack. Can also Ctrl+C in the same terminal window stack was run.
stop:
	docker-compose down

# Stop running containers
kill:
	-docker ps | tail -n +2 | cut -d ' ' -f 1 | xargs docker kill

clean:
	docker image prune -f
	rm -r ./frontend/dist

#####################       Amazon RDS for PostgreSQL     ######################

# Connect via shell to AWS production Postgres database.
db:
	psql \
	   --host=$(AWS_PG_HOST) \
	   --port=$(AWS_PG_PORT) \
	   --username=$(AWS_PG_USER) \
	   --password \
	   --dbname=$(AWS_PG_DATABASE) \

##################      		 		AWS EC2 Deployment   				  ##################

# Authenticate Docker client
ecr-login:
	$(shell aws ecr get-login --profile bmaps --no-include-email --region us-east-2)
ifneq ($?, 0)
	$(shell aws ecr get-login --no-include-email --region us-east-2)
endif

# Build backend image
build:
	docker-compose build

# Login, build, and push latest image to AWS
push: ecr-login build push-be push-fe

push-be: ecr-login build
	docker tag $(BACKEND_REPO):latest $(ECR_URI)/$(BACKEND_REPO):mappening
	docker push $(ECR_URI)/$(BACKEND_REPO):mappening

push-fe: ecr-login build
	docker tag $(FRONTEND_REPO):latest $(ECR_URI)/$(FRONTEND_REPO):mappening
	docker push $(ECR_URI)/$(FRONTEND_REPO):mappening

# Login to AWS instance. Requires *.pem file
ssh:
	ssh ec2-user@$(EC2_IP) -i aws-eb.pem

##################     	  AWS EC2 Dev Instance Deployment     ##################

push-dev: ecr-login build push-dev-be push-dev-fe

push-dev-be: ecr-login build
	docker tag $(BACKEND_REPO):latest $(ECR_URI)/$(BACKEND_REPO):dev
	docker push $(ECR_URI)/$(BACKEND_REPO):dev

push-dev-fe: ecr-login build
	docker tag $(FRONTEND_REPO):latest $(ECR_URI)/$(FRONTEND_REPO):dev
	docker push $(ECR_URI)/$(FRONTEND_REPO):dev

# Login to AWS instance. Requires *.pem file
ssh-dev:
	ssh ec2-user@$(EC2_DEV_IP) -i aws-eb.pem
