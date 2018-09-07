#!/bin/bash
net config server /autodisconnect:-1
winpty vagrant up --provider hyperv
#vagrant ssh -c "cd ~/InterlaceBlockchain/chain && ./startFabric.sh"
IP=`vagrant ssh -c "/sbin/ifconfig eth0 | grep -o '\(inet\ addr:\)[0-9\.]\+'| grep -o '[0-9\.]\+'"`

if [[ $IP =~ ^[0-9.]+$ ]]
then
  vagrant ssh -c "~/runPlayground.sh $IP"
else
  echo "Did not receive a valid IPv4 address: $IP"
fi


