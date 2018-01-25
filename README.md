# Mappening-Deployment

## Overview
A single platform for events across campus. Mappening helps raise awareness of events by aggregating event information from various sources of advertising. 

## Built With
- Flask (Port 5000): Web microframework for Python
- mLab: Database-as-a-Service cloud-hosted MongoDB
- Pymongo: Database Connector between MongoDB and Flask
- AWS EC2/Elastic Container Service for deployment
- nginx (Port 80): Server for static files, forwards requests to backend and serves results
- Mapbox: Open source mapping platform for custom designed maps
- Handlebars.js: Templating language that separates view and code

## Setting Up the Environment
- Download [Docker](https://www.docker.com) and [Docker-Compose](https://github.com/docker/compose/releases) release 1.16.1.  
- Clone the frontend, backend, and deployment repositories
  - `git clone https://github.com/ucladevx/Mappening-Backend.git`  
  - `git clone https://github.com/ucladevx/Mappening-Frontend.git`  
  - `git clone https://github.com/ucladevx/Mappening-Deployment.git`  

## How to Develop Locally
- To run just the [backend](https://github.com/ucladevx/Mappening-Backend) or just the [frontend](https://github.com/ucladevx/Mappening-Frontend) locally check out their individual repositories
- Enter the dev repository
  - `cd Mappening-Deployment/dev`
- Build and run containers
  - `make run`
- Open a second terminal window:
  - Enter frontend container
    - `make ash`
    - Use Makefile within frontend container to update changes to static files
      - `make files`
- Navigate to `localhost` which defaults to port 80

## How to Deploy on AWS
- Enter the prod repository
  - `cd Mappening-Deployment/prod`
- Build + push updated images for [backend](https://github.com/ucladevx/Mappening-Backend) and [frontend](https://github.com/ucladevx/Mappening-Frontend) containers to AWS according to instructions in corresponding repositories
- Login to AWS instance
  - `make ssh`
  - Within instance deploy using the latest images
    - `make deploy`
- Site should be live at www.whatsmappening.io
- Stop running on the instance with `CTRL+C`

## The Team
  - Jorge Fuentes (Tech Lead)
  - Lucy Liao (Designer)
  - Katrina Wijaya (Backend Dev)
  - Jason Xu (Backend Dev)
  - Tanzeela Khan (Frontend Dev)
  - Helen Lee (Frontend Dev)
  - Hannah Elarabawy (Frontend Dev)
  - Sanketh Hegde (Frontend Dev)
  - Doroty Sanussi (PM)

