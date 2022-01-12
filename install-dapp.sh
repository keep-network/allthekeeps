#!/bin/bash

set -e

LOG_START='\n\e[1;36m' # new line + bold + color
LOG_END='\n\e[0m' # new line + reset color

WORKDIR=$PWD

printf "${LOG_START}Installing dependencies for dApp...${LOG_END}"

rm -rf node_modules && yarn cache clean && yarn

printf "${LOG_START}Reading subgraph API..${LOG_END}"

cd keep-subgraph

SUBGRAPH_API=$(head -n 1 subgraph_api)
echo Fetched api: ${SUBGRAPH_API}

printf "${LOG_START}Building dApp...${LOG_END}"

cd ${WORKDIR}

CI=false REACT_APP_SUBGRAPH_API=${SUBGRAPH_API} yarn craco build