#!/bin/bash
# don't forget to run `chmod 700 start-geth-aws.sh` to execute this script

# --------------------------------------------------------------------------
# This file is not needed when systemd is configured correctly
# https://github.com/myHelloGold/ethereum/blob/master/notes/geth-systemd.md
# --------------------------------------------------------------------------

me="$(whoami)"
geth_ps_owner="$(ps -C geth -o ruser= | grep -w $me)"

cmd="nohup /usr/bin/geth --nodiscover --syncmode 'fast' --cache=512 --rpc --rpcaddr=0.0.0.0 --rpcapi='db,eth,net,web3,personal,admin' --rpccorsdomain='*' --ws --wsaddr=0.0.0.0 --wsapi='db,eth,net,web3,personal,admin' --wsorigins='*' --mine --minerthreads='1' --verbosity='0' >/dev/null 2>&1 &"

if [ -z "$geth_ps_owner" ]
then
  eval $cmd
  echo "Geth is running"
else
  echo "Geth already running"
  exit 1
fi
