#!/bin/bash

if [[ ! -d ".env" ]]; then
  echo "Python environment .env does not exist! creating..."
  python3 -m venv .env
  source .env/bin/activate
  pip install --upgrade pip
  pip install --no-cache-dir -r requirements.txt
  deactivate
fi
