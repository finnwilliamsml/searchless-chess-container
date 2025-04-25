#!/bin/bash
set -e
# Download Lc0 network
mkdir -p /app/lc0/build/release
cd /app/lc0/build/release
wget https://storage.lczero.org/files/768x15x24h-t82-swa-7464000.pb.gz
gzip -d 768x15x24h-t82-swa-7464000.pb.gz

# Download and build BayesElo
cd /app
wget https://www.remi-coulom.fr/Bayesian-Elo/bayeselo.tar.bz2
tar -xvjf bayeselo.tar.bz2
cd BayesElo
make bayeselo

# Run data download scripts
cd /app/data
chmod +x download.sh && ./download.sh
cd /app/checkpoints
chmod +x download.sh && ./download.sh

