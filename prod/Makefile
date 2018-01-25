EC2_IP=52.53.72.98

# Login to AWS instance. Requires *.pem file
ssh:
	ssh ubuntu@$(EC2_IP) -i id_rsa_mappening.pem

# Authenticate Docker client
ecr-login:
	$(shell aws ecr get-login --no-include-email --region us-west-1)

# Deploy latest images. Site should be live. 
deploy: ecr-login
	docker-compose pull
	docker-compose up
