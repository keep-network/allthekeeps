#!/bin/bash

set -e

LOG_START='\n\e[1;36m' # new line + bold + color
LOG_END='\n\e[0m' # new line + reset color

printf "${LOG_START}Initializing submodules...${LOG_END}"

git submodule update --init --recursive --remote --rebase --force

printf "${LOG_START}Switching to 'for-allthekeeps-on-ropsten' branch...${LOG_END}"

cd ./keep-subgraph
git checkout for-allthekeeps-on-ropsten
git pull
