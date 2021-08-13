#!/bin/bash

set -e

LOG_START='\n\e[1;36m' # new line + bold + color
LOG_END='\n\e[0m' # new line + reset color

WORKDIR=$PWD

printf "${LOG_START}Installing dependencies for dApp...${LOG_END}"

rm -rf node_modules && yarn cache clean && yarn

printf "${LOG_START}Reading subgraph API..${LOG_END}"

cd keep-subgraph

API_TO_PARSE=$(head -n 1 subgraph_api)
echo Fetched api: ${API_TO_PARSE}

printf "${LOG_START}Building dApp...${LOG_END}"

cd ${WORKDIR}

CI=false REACT_APP_SUBGRAPH_API=${API_TO_PARSE} yarn craco build