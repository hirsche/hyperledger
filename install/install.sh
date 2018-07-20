#!/bin/bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#install nvm and node 8.x
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
echo $NVM_DIR
nvm install --lts

#install dev tools
npm install -g composer-cli
npm install -g composer-rest-server
npm install -g generator-hyperledger-composer
npm install -g yo
npm install -g composer-playground

#fabric server install
mkdir ~/fabric-dev-servers && cd ~/fabric-dev-servers

curl -O https://raw.githubusercontent.com/hyperledger/composer-tools/master/packages/fabric-dev-servers/fabric-dev-servers.tar.gz
tar -xvf fabric-dev-servers.tar.gz
./downloadFabric.sh

#TODO manually
#see: https://hyperledger.github.io/composer/latest/installing/development-tools.html
