#!/bin/bash

#install docker 
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo apt  install docker-compose -y
sudo systemctl enable docker
sudo systemctl start docker

sudo echo ${aws_db_instance.rds_master.password} | sudo tee /root/db_password.txt > /dev/null
sudo echo ${aws_db_instance.rds_master.username} | sudo tee /root/db_username.txt > /dev/null
sudo echo ${aws_db_instance.rds_master.endpoint} | sudo tee /root/db_endpoint.txt > /dev/null
# create docker-compose
sudo cat <<EOF | sudo tee docker-compose.yml > /dev/null
version: '3'

services:
  wordpress:
   image: wordpress:4.8-apache
   ports:
    - 80:80
   environment:
     WORDPRESS_DB_USER: $(cat /root/db_username.txt)
     WORDPRESS_DB_HOST: $(cat /root/db_endpoint.txt)
     WORDPRESS_DB_PASSWORD: $(cat /root/db_password.txt)
   volumes:
     - wordpress-data:/var/wwww/html

volumes:
  wordpress-data:
EOF

sudo docker-compose up
