# Developmental Dora Instance
Testing dev changes with the Dora instance before deploying.

# Testing Frontend/Backend Instances
- You need to choose which port in the aws docker-compose.yml and set the health check port in ec2

## How to Get Dora Instance Running
- Go to EC2 Instances and start the dev-dora instance
- Set up ELB
  - Follow instructions to create a Classic Load Balancer
    - Default VPC
    - Follow the listeners of other ELB
    - Use Mappening-Balancer-Security group
    - Choose a certificate from ACM
    - Edit health check as appropriate
    - Add relevant EC2 Instances
- Push new dora images with `make dora` in the backend/frontend repos
- Go to terminal and navigate to Mappening-Deployment/dora
  - `make ssh`
  - In the ubuntu terminal do `make deploy`
