#!/bin/bash
set -e

mkdir -p /app/lc0/build/release
cd /app/lc0/build/release
wget https://storage.lczero.org/files/768x15x24h-t82-swa-7464000.pb.gz
gzip -d 768x15x24h-t82-swa-7464000.pb.gz
