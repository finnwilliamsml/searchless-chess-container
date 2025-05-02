#!/bin/bash
set -e

pip install --no-cache-dir absl-py
pip install --no-cache-dir apache-beam
pip install --no-cache-dir chess
pip install --no-cache-dir chex
pip install --no-cache-dir dm-haiku
pip install --no-cache-dir grain-nightly
pip install --no-cache-dir jupyter
pip install --no-cache-dir numpy
pip install --no-cache-dir optax
pip install --no-cache-dir orbax-checkpoint
pip install --no-cache-dir pandas
pip install --no-cache-dir scipy
pip install --no-cache-dir typing-extensions
pip install --no-cache-dir --upgrade "jax[cuda12]"

pip download jax==0.6.0 jaxlib==0.6.0+cuda12.cudnn89 -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html

