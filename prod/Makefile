EC2_IP=52.53.72.98

ecr-login:
	$(shell aws ecr get-login --no-include-email --region us-west-1)

ssh:
	ssh ubuntu@$(EC2_IP) -i id_rsa_mappening.pem

deploy: ecr-login
	docker-compose pull
	docker-compose up
