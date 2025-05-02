#!/bin/bash
set -e

pip install --no-cache-dir -r absl-py
pip install --no-cache-dir -r apache-beam
pip install --no-cache-dir -r chess
pip install --no-cache-dir -r chex
pip install --no-cache-dir -r dm-haiku
pip install --no-cache-dir -r grain-nightly
pip install --no-cache-dir -r jupyter
pip install --no-cache-dir -r numpy
pip install --no-cache-dir -r optax
pip install --no-cache-dir -r orbax-checkpoint
pip install --no-cache-dir -r pandas
pip install --no-cache-dir -r scipy
pip install --no-cache-dir -r typing-extensions

pip download jax==0.6.0 jaxlib==0.6.0+cuda12.cudnn89 -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html

