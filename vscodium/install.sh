#!/bin/sh

cat extensions | xargs -n 1 codium --install-extension
