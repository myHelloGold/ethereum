#!/bin/bash

me="$(whoami)"
geth_ps_owner="$(ps -C geth -o ruser= | grep -w $me)"

cmd="nohup geth --nodiscover --fast --cache=512 --rpc --rpcaddr=0.0.0.0 --rpcapi='db,eth,net,web3,personal,admin' --mine --minerthreads=1 --ws --wsaddr=0.0.0.0 --wsapi='db,eth,net,web3,personal,admin' --wsorigins='*' --verbosity='0' &>/dev/null &"

if [ -z "$geth_ps_owner" ]
then
  eval $cmd
  echo "Geth is running"
else
  echo "Geth already running"
  exit 1
fi
