# Developmental Dora Instance
Testing dev changes with the Dora instance before deploying.

# Testing Frontend/Backend Instances
- Build and push the dev image from the corresponding backend/frontend repo with `make dora`
- Navigate to Mappening-Deployment/dora
  - `make ssh`
  - Uncomment the corresponding port in the aws docker-compose.yml with `vi docker-compose.yml`
    - Set the health check port in ec2 to the same port (under Load Balancer)
  - In the ubuntu terminal do `make deploy`
- View deployed site at `http://dev.mappening.io` for frontend or `http://dev.mappening.io:5000/api/<route>` for backend API
    - Depending on how long the site took to set up, the health checker may have disabled the site. Try waiting until 5 health checks pass to view deployed site. Otherwise something is very, very wrong.

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

