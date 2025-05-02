#!/bin/bash
set -e

pip install --no-cache-dir absl-py
pip install --no-cache-dir apache-beam
pip install --no-cache-dir chess
pip install --no-cache-dir chex
pip install --no-cache-dir dm-haiku
pip install --no-cache-dir grain-nightly
pip install --no-cache-dir jax
pip install --no-cache-dir jaxtyping
pip install --no-cache-dir jupyter
pip install --no-cache-dir numpy
pip install --no-cache-dir optax
pip install --no-cache-dir orbax-checkpoint
pip install --no-cache-dir pandas
pip install --no-cache-dir scipy
pip install --no-cache-dir typing-extensions

wget https://storage.googleapis.com/jax-releases/cuda12/jaxlib-0.4.9+cuda12.cudnn88-cp310-cp310-manylinux2014_x86_64.whl
wget https://files.pythonhosted.org/packages/08/fd/9af49f926cbbc686977c41cdee21669288500b5dbf2e8eeb6b50eacfb00e/jax-0.4.9.tar.gz
