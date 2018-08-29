#!/bin/bash

#install nvm and node 8.x
cd ~
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

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

#configure git
git config --global core.autocrlf false
git config --global core.longpaths true

#get fabric and fabric-sample sources
mkdir -p /home/vagrant/go/src/github.com/hyperledger
cd /home/vagrant/go/src/github.com/hyperledger
git clone https://github.com/hyperledger/fabric-samples.git
git clone https://github.com/hyperledger/fabric.git
#and build tools
export GOPATH=/home/vagrant/go/
cd /home/vagrant/go/src/github.com/hyperledger/fabric
make configtxgen cryptogen
#TODO: sudo not possible without interaction
sudo ln -s /home/vagrant/go/src/github.com/hyperledger/fabric/.build/bin/configtxgen
sudo ln -s /home/vagrant/go/src/github.com/hyperledger/fabric/.build/bin/cryptogen

#TODO manually
#see: https://hyperledger.github.io/composer/latest/installing/development-tools.html
