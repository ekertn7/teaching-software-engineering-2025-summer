#!/bin/bash

docker rm -f helper_bot_container 2>/dev/null || true

docker rmi helper_bot 2>/dev/null || true

docker build -t helper_bot .
docker run -d --rm --name helper_bot_container  helper_bot
