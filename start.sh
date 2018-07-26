#!/bin/bash
winpty vagrant up --provider hyperv
vagrant ssh -c "~/fabric-dev-servers/startFabric.sh"
IP=`vagrant ssh -c "/sbin/ifconfig eth0 | grep -o '\(inet\ addr:\)[0-9\.]\+'| grep -o '[0-9\.]\+'"`
vagrant ssh -c "~/runPlayground.sh $IP"