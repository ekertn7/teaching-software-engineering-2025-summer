#!/bin/bash
IMAGE_NAME="my-bot"
CONTAINER_NAME="my-bot-container"
docker build -t $IMAGE_NAME 
docker rm -f $CONTAINER_NAME 2>/dev/null || true
docker run -d \
  --name $CONTAINER_NAME \
  --env-file .env \
  --restart unless-stopped \
  $IMAGE_NAME
echo "Контейнер $CONTAINER_NAME запущен на основе образа $IMAGE_NAME"
