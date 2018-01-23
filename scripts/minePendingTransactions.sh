#!/bin/bash
# change XXX to username
geth --exec 'loadScript("minePendingTransactions.js")' attach ipc:/home/XXX/.ethereum/geth.ipc
