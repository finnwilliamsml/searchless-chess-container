#!/bin/bash
set -e

cd /app/data
chmod +x download.sh && ./download.sh

cd /app/checkpoints
chmod +x download.sh && ./download.sh

