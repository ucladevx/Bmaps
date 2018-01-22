ECR_REPO=698514710897.dkr.ecr.us-west-1.amazonaws.com
APP_NAME_FLASK=web_flask
APP_NAME_NGINX=web_nginx
EC2_IP=52.53.72.98

ecr-login:
	$(shell aws ecr get-login --no-include-email --region us-west-1)

build:
	docker build ../../Mappening/python_app -t $(APP_NAME_FLASK)
	docker build ../../Mappening-Frontend/nginx_app -t $(APP_NAME_NGINX)

push: ecr-login build
	docker tag $(APP_NAME_FLASK):latest $(ECR_REPO)/$(APP_NAME_FLASK):latest
	docker push $(ECR_REPO)/$(APP_NAME_FLASK):latest

	docker tag $(APP_NAME_NGINX):latest $(ECR_REPO)/$(APP_NAME_NGINX):latest
	docker push $(ECR_REPO)/$(APP_NAME_NGINX):latest

ssh:
	ssh ubuntu@$(EC2_IP) -i id_rsa_mappening.pem

deploy: ecr-login
	docker-compose pull
	docker-compose up
