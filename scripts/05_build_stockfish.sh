#!/bin/bash
set -e
cd /app
wget https://developer.download.nvidia.com/compute/cuda/12.8.1/local_installers/cuda-repo-debian12-12-8-local_12.8.1-570.124.06-1_amd64.deb
dpkg -i cuda-repo-debian12-12-8-local_12.8.1-570.124.06-1_amd64.deb
cp /var/cuda-repo-debian12-12-8-local/cuda-*-keyring.gpg /usr/share/keyrings/
apt-get update
apt-get -y install cuda-toolkit-12-8

