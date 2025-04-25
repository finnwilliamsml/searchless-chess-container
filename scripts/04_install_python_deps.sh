#!/bin/bash
set -e
cd /app/searchless_chess/Stockfish/src
make -j profile-build ARCH=x86-64-avx2

