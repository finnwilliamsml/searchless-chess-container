#!/bin/bash
set -e
cd /app/searchless_chess
pip install --no-cache-dir -r requirements.txt
pip install --upgrade "jax[cuda12_pip]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html
