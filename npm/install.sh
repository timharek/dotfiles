#!/usr/bin/env bash

# Install global npm dependencies
sed -e 's/.*@//g' global_packages | xargs -n 1 npm install -g
