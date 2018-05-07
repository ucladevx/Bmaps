# API Instance
API deployed through this instance rather than with the frontend.

## How to Get API Instance Running
- Go to EC2 Instances and start the api-dora instance
- Set up ELB
  - Follow instructions to create a Classic Load Balancer
    - Default VPC
    - Follow the listeners of other ELB
    - Use Mappening-Balancer-Security group
    - Choose a certificate from ACM
    - Edit health check as appropriate
    - Add relevant EC2 Instances
- Push new dora images with `make api` in the backend repo
- Go to terminal and navigate to Mappening-Deployment/api
  - `make ssh`
  - In the ubuntu terminal do `make deploy`

## To Deploy
- Enter the `api` repository
  - `cd Mappening-Deployment/api`
- Build + push updated image for [backend](https://github.com/ucladevx/Mappening-Backend) container to AWS according to instructions in repo
- Login to AWS instance
  - `make ssh`
  - Within instance deploy using the latest image
    - `make deploy`
- API should be live at api.whatsmappening.io:5000/
- Stop running on the instance with `CTRL+C`
