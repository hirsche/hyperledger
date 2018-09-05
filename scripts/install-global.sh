#!/bin/bash

main_user=vagrant
go_path=/home/${main_user}/go
hyperledger_dir=${go_path}/src/github.com/hyperledger

#install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update     
apt-get install -y docker-ce
usermod -aG docker ${main_user}
curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#install git
apt-get install -y git

#net cat install
apt-get install -y netcat

#install python
apt-get install -y python2.7 python-pip

#install go - for non-composer interactions
add-apt-repository ppa:longsleep/golang-backports -y
apt-get update
apt-get install golang-go -y

#configure git
git config --global core.autocrlf false
git config --global core.longpaths true

#get fabric and fabric-sample sources
mkdir -p ${hyperledger_dir}
cd ${hyperledger_dir}
git clone https://github.com/hyperledger/fabric-samples.git
git clone https://github.com/hyperledger/fabric.git


#and build tools
mkdir ${go_path} 2>/dev/null
export GOPATH=${go_path}
cd $hyperledger_dir/fabric
make configtxgen cryptogen
chown -R ${main_user}.${main_user} ${go_path}

cd /usr/bin
ln -s ${hyperledger_dir}/fabric/.build/bin/configtxgen
ln -s ${hyperledger_dir}/fabric/.build/bin/cryptogen
