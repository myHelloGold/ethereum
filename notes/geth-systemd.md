This is how to start/stop/auto-restart the Geth process using systemd.

### Set up the following systemd service:

```
$ sudo nano /etc/systemd/system/geth.service

[Unit]
Description=Geth

[Service]
Type=simple
Restart=always
User=REPLACE_THIS_WITH_THE_MACHINE_USER
ExecStart=/usr/bin/geth --nodiscover --fast --cache 512 --rpc --rpcaddr 0.0.0.0 --rpcapi 'db,eth,net,web3,personal,admin' --rpccorsdomain '*' --ws --wsaddr 0.0.0.0 --wsapi 'db,eth,net,web3,personal,admin' --wsorigins '*' --verbosity '0' --mine --minerthreads '1'

[Install]
WantedBy=default.target
```

### Using The Geth Service

```
# Start service
sudo systemctl start geth

# Stop service
sudo systemctl stop geth

# View all logs
sudo journalctl -u geth

# Tail log
sudo journalctl -f -u geth
```
