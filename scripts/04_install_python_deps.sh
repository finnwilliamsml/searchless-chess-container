#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
pip install --no-cache-dir -r "$SCRIPT_DIR/requirements.txt"

pip download jax==0.6.0 jaxlib==0.6.0+cuda12.cudnn89 -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html

