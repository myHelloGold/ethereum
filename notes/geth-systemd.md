This is how to start/stop/auto-restart the Geth process using systemd.

### Set up the following systemd service:

```
$ sudo nano /etc/systemd/system/geth.service

[Unit]
Description=Geth
After=network.target

[Service]
Type=simple
Restart=always
User=REPLACE_THIS_WITH_THE_MACHINE_USER
RuntimeMaxSec=3600
ExecStart=/usr/bin/geth --nodiscover --rpc --rpcaddr=0.0.0.0 --rpcapi='db,eth,net,web3,personal,admin' --rpccorsdomain='*' --ws --wsaddr=0.0.0.0 --wsapi='db,eth,net,web3,personal,admin' --wsorigins='*' --mine --minerthreads='1' --verbosity='0'

[Install]
WantedBy=default.target
```

**Notes**

- Don't forget to change `REPLACE_THIS_WITH_THE_MACHINE_USER` line above. Run `$ whoami` to get the username.
- The reason why we set `RuntimeMaxSec` to 3600 seconds (1 hour) is because we want to restart Geth every hour to minimize the memory leak problem
- The `--syncmode` and `--cache` flags will make the memory leak even worse. So, better run Geth without those 2 flags.

### Using The Geth Service

```
# Run Geth on startup/reboot
sudo systemctl enable geth

# Manually run Geth
sudo systemctl start geth

# Stop running Geth
sudo systemctl stop geth

# View all logs
sudo journalctl -u geth

# Tail log
sudo journalctl -f -u geth
```
