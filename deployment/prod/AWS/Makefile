# File should match the one in our AWS instance 

# Login to AWS instance
ecr-login:
	sudo $(shell /home/ubuntu/.local/bin/aws ecr get-login --no-include-email --region us-west-1)

# Deploy using the latest pushed images
deploy: ecr-login
	sudo docker-compose pull
	sudo docker-compose up
