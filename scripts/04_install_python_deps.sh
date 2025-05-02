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

wget https://files.pythonhosted.org/packages/31/25/32c5e2c919da4faaea9ef5088437ab6e01738c49402e4ec8a6c7b49e30ef/jax-0.6.0-py3-none-any.whl
wget https://files.pythonhosted.org/packages/7c/16/30adb773e3db553ac9a8fa6688e3f65f7ccc39798088ba4cf77e9d9314c3/jaxlib-0.6.0-cp310-cp310-manylinux2014_x86_64.whl
