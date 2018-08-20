Work in progress...

#### How to setup two-nodes private blockchain on AWS EC2?

- Part 1 (Required) - Refer [this tutorial](https://blockgeeks.com/two-node-setup-of-a-private-ethereum/)
- Part 2 (Optional) - Refer [this tutorial](https://blockgeeks.com/two-node-setup-of-a-private-ethereum-on-aws-with-contract-deployment-part-2/)

#### How to join the first node?

Change this:

```
enode://xxx@[::]:30304?discport=0
```

to:

```
enode://xxx@server-ip:udp-port?discport=0
```

Example:

```
enode://xxx@192.168.0.170:30304?discport=0
```

#### How to auto-join the first node after reboot (only for second node)?

Please refer [this guide](https://github.com/ethereum/go-ethereum/wiki/Connecting-to-the-network#static-nodes).

Example of `static-nodes.json` file:

```
["enode://xxx@123.45.67.890:30303?discport=0"]
```
