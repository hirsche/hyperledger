#!/bin/bash
vagrant up --provider virtualbox
#vagrant ssh -c "cd ~/InterlaceBlockchain/chain && ./startFabric.sh"
#IP=`vagrant ssh -c "/sbin/ifconfig eth0 | grep -o '\(inet\ addr:\)[0-9\.]\+'| grep -o '[0-9\.]\+'"`

vagrant ssh -c "~/runPlayground.sh"
