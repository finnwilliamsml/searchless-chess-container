#!/bin/bash
set -e
cd /app
wget https://developer.download.nvidia.com/compute/cudnn/9.8.0/local_installers/cudnn-local-repo-debian12-9.8.0_1.0-1_amd64.deb
dpkg -i cudnn-local-repo-debian12-9.8.0_1.0-1_amd64.deb
cp /var/cuda-repo-debian12-9-8-local/cudnn-*-keyring.gpg /usr/share/keyrings/
apt-get update
apt-get -y install cudnn

