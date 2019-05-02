# Mappening-Deployment

## Overview
A single platform for events across campus. Mappening helps raise awareness of events by aggregating event information from various sources of advertising.

## Built With
- Python 2.7.14
- Flask: Web microframework for Python
- mLab: Database-as-a-Service cloud-hosted MongoDB
- Pymongo: Database Connector between MongoDB and Flask
- AWS EC2/Elastic Container Service for deployment
- nginx: Server for static files, forwards requests to backend and serves results
- Mapbox: Open source mapping platform for custom designed maps

## Setting Up the Environment
- Download [Docker](https://www.docker.com) and [Docker-Compose](https://github.com/docker/compose/releases) release 1.16.1.
- Clone the frontend, backend, and deployment repositories (and follow relevant instructions per repo)
  - `git clone https://github.com/ucladevx/Mappening-Frontend.git`
  - `git clone https://github.com/ucladevx/Mappening-Backend.git`
  - `git clone https://github.com/ucladevx/Mappening-Deployment.git`
- Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
  - Configure CLI with `aws configure`
  - Requires AWS secret info (only for PM/TL)
  - NOTE: Computer local time must be accurate lol @Hakan
- Get the `.env` file which contains sensitive information from a dev and add it to Mappening-Backend/src/mappening/utils/
- Get the `*.pem` files for each folder in Mappening-Deployment as needed

## How to Deploy on AWS
- Build + push updated images for [backend](https://github.com/ucladevx/Mappening-Backend) and [frontend](https://github.com/ucladevx/Mappening-Frontend) containers to AWS according to instructions in corresponding repositories
- Enter the repository
  - To deploy Mappening frontend: `cd Mappening-Deployment/prod`
  - To deploy dev site frontend: `cd Mappening-Deployment/dora`
  - To deploy backend API: `cd Mappening-Deployment/api`
- Login to respective AWS instance to deploy
  - `make ssh`
  - Within instance shell deploy using the latest images
    - `make deploy`
- Site should be live at [www.mappening.io](https://www.mappening.io), [dev.mappening.io](https://dev.mappening.io), or [api.mappening.io](https://api.mappening.io:5000), respectively
- Stop running on the instance with `CTRL+C`
  - Warning: this will kill the site. Close terminal/tab to just exit console.

## Repository Breakdown
- Backend API deployment in `api/`
- Frontend deployment in `prod/`
- Test instance deployment in `dora/`
- ~~Local dev in `dev/~~`
  - *Deprecated*: was used to develop and run backend + frontend together

## The Team

  - Katrina Wijaya, Tech Lead/Backend Dev (Fall 2017 - Present)
  - Doroty Sanussi, PM (Winter 2018 - Present)
  - Hakan Alpay, Frontend Dev (Spring 2018 - Present)
  - Olivia Chen, Designer (Fall 2018 - Present)
  - Ryan Holland, Frontend Dev (Fall 2018 - Present)
  - Yinghao (Howard) Wang, Backend Dev (Fall 2018 - Present)
  - Linda Wu, Marketing (Winter 2019 - Present)
  - Tanzeela Khan, Frontend Dev (Fall 2017 - Spring 2018, Spring 2019)
  - Jorge Fuentes, Backend Dev (Fall 2017 - Spring 2018, Spring 2019)
  - Enika Biswas, Backend Dev (Spring 2019 - Present)
  - Radhika Ahuja, Frontend Dev (Spring 2019 - Present)
  - Will Fehrnstrom, Frontend Dev (Spring 2019 - Present)
  - Jack Zhang, Frontend Dev (Spring 2019 - Present)

### Former Members
  - Lucy Liao, Designer (Fall 2017 - Spring 2018)
  - Jason Xu, Backend Dev (Fall 2017 - Spring 2018)
  - Sanketh Hegde, Frontend Dev (Winter 2018 - Winter 2019)
  - Richard Sun, Frontend Dev (Spring 2018)
  - Melissa Cox, Designer Intern (Spring 2018)
  - Helen Lee, Frontend Dev (Fall 2017 - Winter 2018)
  - Hannah Elarabawy, Frontend Dev (Fall 2017 - Winter 2018)
  - Dharma Naidu, Backend Dev (Fall 2018)

