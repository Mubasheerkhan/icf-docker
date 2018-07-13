#!/usr/bin/env bash

apt-get update -y
apt-get remove docker docker-engine docker.io
apt-get install -y apt-transport-https ca-certificates curl \
   linux-image-extra-$(uname -r) \
   linux-image-extra-virtual \
   software-properties-common \
   python-pip
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
usermod -aG docker ubuntu

