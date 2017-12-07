#### List all accounts and their balances in current node

```
var accounts = eth.accounts; for (i = 0; i < accounts.length; i++) { console.log( accounts[i] + " - " + web3.fromWei(eth.getBalance(accounts[i]), "ether") ); };
```
