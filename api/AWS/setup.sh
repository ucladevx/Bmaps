#! /bin/bash
 
# set up docker and utils
sudo apt update
sudo apt upgrade
 
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl git make python python-pip \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
 
sudo apt update
sudo apt install docker-ce
 
sudo bash -c 'curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` > /usr/bin/docker-compose'
sudo chmod +x /usr/bin/docker-compose
 
sudo service docker start
 
# set up aws
pip install pip --upgrade
pip install awscli --upgrade --user
aws configure
