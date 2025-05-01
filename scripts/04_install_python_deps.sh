#!/bin/bash
set -e

pip install --no-cache-dir -r /scripts/requirements.txt

pip download jax==0.6.0 jaxlib==0.6.0+cuda12.cudnn89 -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html

