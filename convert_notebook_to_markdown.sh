#!/bin/bash

./create_env.sh

echo "Copying assets dirs"
cp -r notebooks/assets markdown/

source .env/bin/activate
for file in $(ls -1 notebooks/*.ipynb); do
  if [ "$file" != "notebooks/00_sumario.ipynb" ]; then
    jupyter nbconvert --to markdown --output-dir markdown $file
  fi
done
deactivate
