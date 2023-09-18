#!/bin/bash

sudo yum update -y
sudo yum install docker -y
wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)
sudo mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose
sudo chmod -v +x /usr/local/bin/docker-compose
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo yum -y install amazon-efs-utils
sudo mkdir -p ${mount_directory}
sudo mount -t efs -o tls ${efs_volume_id}:/ ${mount_directory}
sudo docker run --restart=always --name wordpress-docker -e WORDPRESS_DB_USER=${dbuser} -e WORDPRESS_DB_HOST=${dbendpoint} -e WORDPRESS_DB_PASSWORD=${dbpassword}  -e WORDPRESS_DB_NAME=${db_name} -v ${mount_directory}:${mount_directory} -p 80:80 -d wordpress
