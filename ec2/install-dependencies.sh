#!/bin/bash
sudo apt-get update

# Instalação do Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker ubuntu  # Adiciona o usuário "ubuntu" ao grupo "docker"

# Instalação do Portainer CE
#echo "Installing Portainer CE"
#docker volume create portainer_data
#docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

# Instalação do Apache NiFi via Docker
#echo "Installing Apache NiFi"
#docker run -d --name=nifi --restart=always -p 8080:8080 -p 8443:8443 -p 10000:10000 -p 8000:8000 -p 8181:8181 -e NIFI_WEB_HTTP_PORT='8080' -e NIFI_WEB_HTTPS_HOST='' -e NIFI_WEB_HTTPS_PORT='' -v nifi_data:/opt/nifi/nifi-current/data apache/nifi:latest

# Clone o arquivo docker-compose.yml (ou copie de algum lugar)
wget -O docker-compose.yml https://gist.githubusercontent.com/hawllysson-gardel/f5f221ddf2b35c8c528ef732effb1ab8/raw/8ed5c916285d89bed0810128a44b2768a788aa30/docker-compose-environment-nifi.yml

# Iniciar os contêineres com Docker Compose
docker-compose up -d

# Habilitar "linger" para o usuário ubuntu
sudo loginctl enable-linger ubuntu

echo "Portainer CE setup completed"
