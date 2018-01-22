#!/bin/bash
docker run --name block_explorer --restart always -it -p 8000:8000 -d zulhfreelancer/ethereum_explorer:latest
