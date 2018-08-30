#!/bin/bash

#install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update     
apt-get install -y docker-ce
usermod -aG docker vagrant
curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#install git
apt-get install -y git

#install python
apt-get install -y python2.7 python-pip

#install go - for non-composer interactions
add-apt-repository ppa:longsleep/golang-backports -y
apt-get update
apt-get install golang-go -y

#configure git
git config --global core.autocrlf false
git config --global core.longpaths true

hyperledger_dir=/home/vagrant/go/src/github.com/hyperledger

#get fabric and fabric-sample sources
mkdir -p $hyperledger_dir
cd $hyperledger_dir
git clone https://github.com/hyperledger/fabric-samples.git
git clone https://github.com/hyperledger/fabric.git

#and build tools
mkdir /home/vagrant/go/ 2>/dev/null
export GOPATH=/home/vagrant/go/
cd $hyperledger_dir/fabric
make configtxgen cryptogen
chown -R vagrant.vagrant /home/vagrant/go
#TODO: sudo not possible without interaction
cd /usr/bin
ln -s /home/vagrant/go/src/github.com/hyperledger/fabric/.build/bin/configtxgen
ln -s /home/vagrant/go/src/github.com/hyperledger/fabric/.build/bin/cryptogen
