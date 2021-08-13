#!/bin/bash

set -e

LOG_START='\n\e[1;36m' # new line + bold + color
LOG_END='\n\e[0m' # new line + reset color

WORKDIR=$PWD

printf "${LOG_START}Installing repositories...${LOG_END}"

./install-repositories.sh

cd keep-subgraph

printf "${LOG_START}Running subgraph scripts...${LOG_END}"

CONTRACT_OWNER_ETH_ACCOUNT_PRIVATE_KEY=${CONTRACT_OWNER_ETH_ACCOUNT_PRIVATE_KEY} ETH_RPC_URL=${ETH_RPC_URL} SUBGRAPH_DEPLOY_KEY=${SUBGRAPH_DEPLOY_KEY} SUBGRAPH_SLUG=${SUBGRAPH_SLUG} ./deploy-subgraph.sh

printf "${LOG_START}Starting dApp...${LOG_END}"

cd ${WORKDIR}

./run-dapp-locally.sh