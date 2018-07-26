#!/bin/bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
IP=$1
PL=../lib/node_modules/composer-playground/cli.js

rm -f nohup.out
screen -d -m $NVM_BIN/node $NVM_BIN/$PL
echo "waiting for playground to start ..."
while ! nc -z $IP 8080; do
  sleep 0.1 # wait for 1/10 of the second before check again
done

echo "playground launched."
