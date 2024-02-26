#!/bin/sh
set -e

echo "Activating feature 'slither'"


# Check if pip3 is installed
if ! command -v pip3 &> /dev/null
then
  echo "pip3 could not be found, installing it"
  apt-get update
  apt-get install -y python3-pip
fi

# Install slither
pip3 install slither-analyzer