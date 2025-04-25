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
    ninja-build \
    meson \
    libgtest-dev
    && rm -rf /var/lib/apt/lists/*

# Clone the repo into the container
RUN git clone https://github.com/google-deepmind/searchless_chess.git

# Set working directory to the cloned repo
WORKDIR /app/searchless_chess

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

RUN pip install --upgrade "jax[cuda12_pip]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html

RUN git clone https://github.com/official-stockfish/Stockfish.git && \
    cd Stockfish/src && \
    make -j profile-build ARCH=x86-64-avx2

# Download and install CUDA 12.8.1
RUN wget https://developer.download.nvidia.com/compute/cuda/12.8.1/local_installers/cuda-repo-debian12-12-8-local_12.8.1-570.124.06-1_amd64.deb && \
    dpkg -i cuda-repo-debian12-12-8-local_12.8.1-570.124.06-1_amd64.deb && \
    cp /var/cuda-repo-debian12-12-8-local/cuda-*-keyring.gpg /usr/share/keyrings/ && \
    apt-get update && \
    apt-get -y install cuda-toolkit-12-8

# Download and install cuDNN 9.8.0
RUN wget https://developer.download.nvidia.com/compute/cudnn/9.8.0/local_installers/cudnn-local-repo-debian12-9.8.0_1.0-1_amd64.deb && \
    dpkg -i cudnn-local-repo-debian12-9.8.0_1.0-1_amd64.deb && \
    cp /var/cuda-repo-debian12-9-8-local/cudnn-*-keyring.gpg /usr/share/keyrings/ && \
    apt-get update && \
    apt-get -y install cudnn

# Change to the appropriate directory and download the network weights
WORKDIR /app/lc0/build/release

# Download and decompress the network weights
RUN wget https://storage.lczero.org/files/768x15x24h-t82-swa-7464000.pb.gz && \
    gzip -d 768x15x24h-t82-swa-7464000.pb.gz

# Return to the project root
WORKDIR /app

# Download and extract BayesElo, then build it
WORKDIR /app

RUN wget https://www.remi-coulom.fr/Bayesian-Elo/bayeselo.tar.bz2 && \
    tar -xvjf bayeselo.tar.bz2 && \
    cd BayesElo && \
    make bayeselo && \
    cd ..

WORKDIR /app/data
RUN chmod +x download.sh && ./download.sh
WORKDIR /app

WORKDIR /app/checkpoints
RUN chmod +x download.sh && ./download.sh
WORKDIR /app


# Default command when running the container
CMD [ "/bin/bash" ]
