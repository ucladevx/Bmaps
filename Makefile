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

#####################       Amazon RDS for PostgreSQL     ######################

# Connect via shell to AWS production Postgres database.
db:
	psql \
	   --host=$(AWS_PG_HOST) \
	   --port=$(AWS_PG_PORT) \
	   --username=$(AWS_PG_USER) \
	   --password \
	   --dbname=$(AWS_PG_DATABASE) \

##################       AWS Elastic Beanstalk Deployment     ##################

# Authenticate Docker client
ecr-login:
	$(shell aws ecr get-login --no-include-email --region us-east-2)

# Build backend image
build:
	docker-compose build

# Login, build, and push latest image to AWS
push: ecr-login build
	docker tag $(BACKEND_REPO):latest $(ECR_URI)/$(BACKEND_REPO):latest
	docker push $(ECR_URI)/$(BACKEND_REPO):latest
	docker tag $(FRONTEND_REPO):latest $(ECR_URI)/$(FRONTEND_REPO):latest
	docker push $(ECR_URI)/$(FRONTEND_REPO):latest

zip:
	zip mappening.zip Dockerrun.aws.json

local:
	eb local run

deploy:
	eb deploy

# sudo docker ps
# curl localhost:5000
# sudo docker logs -f <cid>
ssh-ec2:
	ssh -i /Users/kwijaya/.ssh/aws-eb ec2-user@ec2-18-191-176-111.us-east-2.compute.amazonaws.com

ssh-eb:
	eb ssh
