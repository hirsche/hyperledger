#!/bin/bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
PL=../lib/node_modules/composer-playground/cli.js

screen -d -m $NVM_BIN/node $NVM_BIN/$PL
echo "waiting for playground to start ..."

while ! nc -z interlace.chain 8080; do
  sleep 1 # wait for one second before check again
done
if ! [ $? -eq 0 ]; then
    >&2 echo "Error starting playground."
    exit 1
fi
echo "playground launched."
