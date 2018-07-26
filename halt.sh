#!/bin/bash
vagrant ssh -c "~/fabric-dev-servers/stopFabric.sh"
winpty vagrant halt