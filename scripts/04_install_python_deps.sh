#!/bin/bash
set -e

git clone https://github.com/google-deepmind/searchless_chess.git
cd searchless_chess

pip install --no-cache-dir -r requirements.txt

cd ..

mv searchless_chess old_repo
