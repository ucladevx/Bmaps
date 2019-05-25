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
