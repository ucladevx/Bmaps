# AWS

Contains all the files for deployment. Should be maintained alongside files in AWS instance (reached through `make ssh`). Instructions for dealing with AWS are as follows:

## To Deploy
- Enter the prod repository
  - `cd Mappening-Deployment/prod`
- Build + push updated images for [backend](https://github.com/ucladevx/Mappening-Backend) and [frontend](https://github.com/ucladevx/Mappening-Frontend) containers to AWS according to instructions in corresponding repositories
- Login to AWS instance
  - `make ssh`
  - Within instance deploy using the latest images
    - `make deploy`
- Site should be live at www.whatsmappening.io
- Stop running on the instance with `CTRL+C`

# Out-of-Date Instructions

## Set up ubuntu instance
- Add setup.sh, docker-compose.yml, and Makefile
- Run setup.sh script

## Set up HTTPS in AWS.
General steps to do so:
- Get certificate with ACM (AWS' Certificate Manager)
- Follow instructions to create an ELB
- Connect ELB to EC2 Instance
- Set up security group for ELB for port 80/443 (and any ports that need to be forwarded such as 5000 for api calls). These are actually called Listeners.
- Change routes in Route53 to create Alias for ELB
- In frontend code use domain names + HTTPS (otherwise will see non-secure endpoint in scripts and complain)

## To Add New Container
- Log in to AWS account [here](devx-dora.signin.aws.amazon.com/console)
- Click on Services > Compute > Elastic Container Service > Repositories 
- Click `Create repository` and give it a name `<repo_name>`
- Click `Next step` and ignore the instructions supplied
- In relevant repository, modify the Makefile
  - Add new app name var: `APP_NAME_<repo_name>=<repo_name>`
  - Add new line to `build` target: `docker build ./<repo_name> -t $(APP_NAME_<repo_name>)`
  - Add new lines to `push` target: 
    - `docker tag $(APP_NAME_<repo_name>):latest $(ECR_REPO)/$(APP_NAME_<repo_name>):latest`
    - `docker push $(ECR_REPO)/$(APP_NAME_<repo_name>):latest`
- If new container runs on a new port, follow the instructions below to edit the instance
- Otherwise, deploy as normal to AWS and all should work (hopefully)


## To Edit Instance/Open New Port
- Log in to AWS account [here](devx-dora.signin.aws.amazon.com/console)
- Click on Services > Compute > EC2 > Repositories > Instances
- Click on your running instance 
- On the bottom of the screen, you can modify instance Tags or create Alarms
- On the far right of the screen, under the Security Groups filter, click the link
- On the bottom of the screen, click Inbound > Edit 
- New ports can now be opened by clicking `Add Rule` and adding a Custom TCP Rule using the approrpiate Port Range
