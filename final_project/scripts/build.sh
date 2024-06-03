#!/usr/bin/bash

# This script builds the Dockerfile. Shortcut.

# Calculate Dockerfile path for strength.
dirPath=$(realpath $(dirname $0)/..)

sudo docker build -t multiserver $dirPath
