#!/bin/bash

docker rm -f hw1_bot_container 2>/dev/null || true

docker rmi hw1_bot 2>/dev/null || true

docker build -t hw1_bot .
docker run -d --rm --name hw1_bot_container  hw1_bot
