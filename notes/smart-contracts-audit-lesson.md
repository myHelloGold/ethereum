## Smart Contract Audit Lesson

_Last update_: 9 Jan 2018 by Zulh

* Abstract contract contains prototype function which we can override later in other contracts
* SafeMath library allow us to reject transactions that overflow and underflow
* `.add` and `.sub` are the methods from SafeMath library
* If a line in a function that contains SafeMath failed and throw exception, the entire transaction inside the function will be reverted - all remaining gas will be refunded to sender
* If we set our token to zero `decimals` place, that means our tokens are in whole number (`1`, `2`, `3`, ...) and does not has decimal place like `1.2345`
* The shorthand for setting owner is equal to sender is by putting it inside the variable declaration:

```
address public owner = msg.sender;
```

* To call function inside the parent contract, use `super` keyword. Example:

```
super.transfer(address, amount);
```
* We can use mapping of address to struct to store metadata of the address i.e. maximum number of token they address can buy, how much left (remainder) and etc
* `EmergencyERC20TokensDrain` should be inside TokenSale contract and Token contract especially if the contracts are on main net - the contract(s) might get free token from anonymous and this function will allow the contract owner to transfer the free tokens to another wallet/account
* _Internal Transaction_ inside EtherScan web UI is when we are sending ETH and tokens between contracts