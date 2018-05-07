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
- Clone the frontend, backend, and deployment repositories
  - `git clone https://github.com/ucladevx/Mappening-Frontend.git`
  - `git clone https://github.com/ucladevx/Mappening-Backend.git`
  - `git clone https://github.com/ucladevx/Mappening-Deployment.git`
- Get the `.env` file which contains sensitive information from a dev and add it to Mappening-Backend/src/mappening/utils/
- Get the `*.pem` files for each folder in Mappening-Deployment as needed

## How to Develop Locally
- To run just the [backend](https://github.com/ucladevx/Mappening-Backend) or just the [frontend](https://github.com/ucladevx/Mappening-Frontend) locally check out their individual repositories
- To run both backend and frontend together
  - OUT OF DATE
  - NO LONGER WORKS
  - Honestly not worth keeping up to date as we always dev separately
  - Enter the dev repository
    - `cd Mappening-Deployment/dev`
  - Build and run containers
    - `make run`

## How to Deploy on AWS
- Enter the prod repository
  - `cd Mappening-Deployment/prod`
- Build + push updated images for [backend](https://github.com/ucladevx/Mappening-Backend) and [frontend](https://github.com/ucladevx/Mappening-Frontend) containers to AWS according to instructions in corresponding repositories
- Login to AWS prod instance to deploy frontend and AWS api instance to deploy backend
  - `make ssh`
  - Within instance deploy using the latest images
    - `make deploy`
- Site should be live at www.whatsmappening.io
- Stop running on the instance with `CTRL+C`

## The Team
  - Doroty Sanussi, PM (Winter 2018 - Present)
  - Jorge Fuentes, Tech Lead (Fall 2018 - Present)
  - Lucy Liao, Designer (Fall 2018 - Present)
  - Katrina Wijaya, Backend Dev (Fall 2018 - Present)
  - Jason Xu, Backend Dev (Fall 2018 - Present)
  - Tanzeela Khan, Frontend Dev (Fall 2018 - Present)
  - Sanketh Hegde, Frontend Dev (Winter 2018 - Present)
  - Richard Sun, Frontend Dev (Spring 2018 - Present)
  - Hakan Alpay, Frontend Dev (Spring 2018 - Present)
  - Melissa Cox, Designer Intern (Spring 2018 - Present)
  - Helen Lee, Frontend Dev (Fall 2018 - Winter 2018)
  - Hannah Elarabawy, Frontend Dev (Fall 2018 - Winter 2018)

