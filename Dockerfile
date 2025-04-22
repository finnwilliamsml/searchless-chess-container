# Start with a Python base image
FROM python:3.10-slim

# Set working directory inside the container
WORKDIR /app

# Install system-level dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Clone the repo into the container
RUN git clone https://github.com/google-deepmind/searchless_chess.git

# Set working directory to the cloned repo
WORKDIR /app/searchless_chess

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

RUN pip install --upgrade "jax[cuda12_pip]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html

# Default command when running the container
CMD [ "/bin/bash" ]
