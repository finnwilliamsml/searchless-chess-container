#!/bin/bash
set -e

apt-get update && apt-get install -y \
    build-essential \
    git \
    wget \
    curl \
    ninja-build \
    meson \
    libgtest-dev \
&& rm -rf /var/lib/apt/lists/*

