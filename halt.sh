#!/bin/bash
vagrant ssh -c "cd ~/InterlaceBlockchain/chain && ./stopFabric.sh"
winpty vagrant halt