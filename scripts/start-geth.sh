me="$(whoami)"
geth_ps_owner="$(ps -C geth -o ruser= | grep -w $me)"

my_local_ip="$(ip route get 8.8.8.8 | awk '{print $NF; exit}')"

cmd="geth --nodiscover --fast --cache=512 --rpc --rpcaddr 0.0.0.0 --rpcport 8546 --rpcapi='db,eth,net,web3,personal,admin' --port 30304 --mine --minerthreads=1 --ws --wsport 8547 --wsapi='db,eth,net,web3,personal,admin' --wsorigins='*' --wsaddr $my_local_ip --verbosity 0 &>/dev/null &"

if [ -z "$geth_ps_owner" ]
then
  eval $cmd
  echo "Geth is running"
else
  echo "Geth already running"
  exit 1
fi
