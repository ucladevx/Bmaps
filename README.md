# Mappening

## Overview
A single platform for events across campus. Mappening helps raise awareness of events by aggregating event information from various sources of advertising.

## Built With

- Python 3.7 (base image python:3.7-alpine3.8)
- Postgres/Amazon RDS for PostgreSQL
- Flask
- Scikit-Learn
- Angular 7
- Mapbox
- NGINX
- Yarn
- AWS EC2/ELB/ECR

## Setting Up the Environment

- Download [Docker](https://www.docker.com) 
  - Should come with Docker-Compose
  - Follow respective directions to install for Mac/Windows
- Clone the [frontend](https://github.com/ucladevx/Mappening-Frontend), [backend](https://github.com/ucladevx/Mappening-Backend), and main [Mappening](https://github.com/ucladevx/Mappening) repositories
  - Install as git submodules
    - `git clone --recurse-submodules https://github.com/ucladevx/Mappening`
    - Follow relevant instructions per repo
- Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) (only for PM/TL)
  - Configure CLI with `aws configure`
  - Requires AWS secret info
  - Get `aws-eb.pem` permission file
  - NOTE: Computer local time must be accurate lol @Hakan
- Get the `.env` file which contains sensitive information from a dev and add it to Mappening-Backend/src/mappening/utils/

## How to Run Locally

- Run production build of stack

  - Uses production build of Angular Frontend and Flask Backend

  ```bash
  $ make run
  ```

- Stop the stack with `Ctrl+C` or make command

  ```bash
  $ make stop
  ```

- Kill any running containers if `make stop` fails

  ```bash
  $ make kill
  ```

## How to Deploy on AWS

- Build and push frontend and backend images to AWS ECR

  ```bash
  $ make push
  ```

  - Can specifically push and tag the frontend or backend as well

    ```bash
    $ make push-be
    $ make push-fe
    ```

- Deploy to the production AWS EC2 instance

  - Files in `deployment/` folder should be kept up to date with files in EC2 instance

  ```bash
  $ make ssh
  [ec2-user@... ~]$ make deploy
  ```

- Site should be live at [www.mappening.io](https://www.mappening.io)

#### Dev Instance Deployment

- Can also build/push to a dev website for testing

  ```bash
  # Push backend and frontend
  $ make push-dev
  
  # Or can push backend/frontend separately
  $ make push-dev-be
  $ make push-dev-fe
  ```

- Deploy to the developmental AWS EC2 instance

  ```bash
  $ make ssh-dev
  [ec2-user@... ~]$ make deploy
  ```

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

