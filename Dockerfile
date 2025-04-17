# Dockerfile
FROM ubuntu:22.04

# Basic setup
RUN apt-get update && apt-get install -y \
    build-essential \
    python3 \
    python3-pip \
    git \
    wget \
    curl

# Optional: install conda or other dependencies
# COPY environment.yml /tmp/
# RUN conda env create -f /tmp/environment.yml

# Set default workdir
WORKDIR /workspace
