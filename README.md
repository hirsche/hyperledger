# hyperledger

Environment for running and developing hyperledger fabric applications using vagrant. This branch uses virtualbox instead of hyper-v. Operating system used is Unbuntu 16.04 LTS.

## Prerequisites

* Install virtualbox
* Install vagrant
* Install git
* call `git clone https://github.com/InterlaceProject/InterlaceBlockchain.git` in this directory
* Install vagrant-hostmanager: `vagrant plugin install vagrant-hostmanager`

## Start

`./start.sh`

After startup the virtual machine should be accessible over hostname `interlace.chain` which is linking to localhost. Thus playground should be startble with `http://interlace.chain:8080` from any browser.

Run `vagrant ssh` in order to access the virtual machine.

## Stop

`./halt.sh`
