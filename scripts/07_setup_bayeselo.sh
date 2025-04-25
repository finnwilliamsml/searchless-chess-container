#!/bin/bash
set -e

cd /app
wget https://www.remi-coulom.fr/Bayesian-Elo/bayeselo.tar.bz2
tar -xvjf bayeselo.tar.bz2
cd BayesElo
make bayeselo
