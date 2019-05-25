# Include Environment Variables from .env file
include .env 

# Creates and runs a static production build of the Angular frontend. Runs
# Backend Flask API in separate container.
run:
	docker-compose up --build

# Stops the stack. Can also Ctrl+C in the same terminal window stack was run.
stop:
	docker-compose down

#####################       Amazon RDS for PostgreSQL     ######################

# Connect via shell to Postgres database.
db:
	psql \
	   --host=$(AWS_PG_HOST) \
	   --port=$(AWS_PG_PORT) \
	   --username=$(AWS_PG_USER) \
	   --password \
	   --dbname=$(AWS_PG_DATABASE) \

##################       AWS Elastic Beanstalk Deployment     ##################

# Dependency of `zip` target that requires VERSION to be set.
check-version:
ifndef VERSION
	$(error VERSION is undefined)
endif

# Bundle application code and move to versions folder
# Specify VERSION by passing environment variable with call
# $ make zip VERSION=4.2
zip: check-version
	git archive -v -o ./deploymentversions/event_portal_v$(VERSION).zip --format=zip HEAD
