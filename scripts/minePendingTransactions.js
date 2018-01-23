/*
* reference:
* https://ethereum.stackexchange.com/a/3152/26362
* https://github.com/ethereumproject/go-ethereum/wiki/bitchin-tricks#mining
*/

var datetime = new Date().toLocaleString()
var mining_threads = 1

function checkWork() {
    if (eth.getBlock("pending").transactions.length > 0) {
        if (eth.mining) return;
        console.log(datetime + " - Pending transactions found. Mining started.");
        miner.start(mining_threads);
    } else {
        miner.stop();
        console.log(datetime + " - No transactions found. Mining stopped.");
    }
}

checkWork();
