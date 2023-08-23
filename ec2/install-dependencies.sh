#!/bin/bash

sudo apt-get update

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

curl -o docker-compose.yml https://gist.githubusercontent.com/hawllysson-gardel/f5f221ddf2b35c8c528ef732effb1ab8/raw/302eeefe7d14b69a9a383aab07fd2a7b0fe3295f/docker-compose-environment-nifi.yml

docker-compose -p nifi up -d

chown -R 1000:1000 /nifi
chown -R 1000:1000 /nifi_registry

sudo loginctl enable-linger ubuntu

echo "Setup Completed"
