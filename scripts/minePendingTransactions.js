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

eth.filter("latest", function(err, block) { checkWork(); });
eth.filter("pending", function(err, block) { checkWork(); });

checkWork();
