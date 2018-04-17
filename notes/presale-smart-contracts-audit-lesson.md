## Pre-sale Contract Lesson

1. The important variables like `weiRaised`, `startTime` and `endTime` should be `public`.
2. If we call something from chain i.e. weiRaise, we should `view` instead of `constant`.
3. Instead of having many functions to do purchase checking, just create a modifier and put all of them inside it using `require` keyword.
4. Whatever you name inside the `returns ()` will be returned to you. So, you don't have to `return xxx` again inside the function.
5. If you want to know what is the minimum and maximum of two numbers, use `Math.sol` file from Open-Zeppelin.
6. You can use `enum` in the smart-contract as-well.
7. In MiniMiToken, the `controller` only can generate and destroy tokens. This `controller` is `address`.
8. Two ways to get Ether into a contract if the contract doesn't has `payable` functions:

- coinbase - someone can join the node (`admin.addPeer`) and change the coinbase to the contract that has not `payable` function
- selfDestruct a contract and tell it to send all Ethers in it to the contract that has no `payable` function - it will accept it and will not reject it
