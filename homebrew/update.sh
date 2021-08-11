#!/usr/bin/env bash

# Update formulas and caks
brew list -1 --formula > formulas

brew list -l1 --cask > casks
