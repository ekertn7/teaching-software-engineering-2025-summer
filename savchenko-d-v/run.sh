#!/bin/bash

IMAGE_NAME="assist_bot"
CONTAINER_NAME="assist_bot_container"

docker rm -f $CONTAINER_NAME 2>/dev/null || true
docker rmi -f $IMAGE_NAME 2>/dev/null || true

docker build -t $IMAGE_NAME .

docker run -d \
  --name $CONTAINER_NAME \
  --env-file .env \
  --restart unless-stopped \
  $IMAGE_NAME
