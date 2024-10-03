#!/bin/bash

./create_env.sh

source .env/bin/activate
for file in $(ls -1 notebooks/*.ipynb); do
  jupyter nbconvert --to markdown --output-dir markdown $file
done
deactivate
