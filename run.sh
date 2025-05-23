#!/bin/bash

echo "✅ Скрипт запущен"

IMAGE_NAME=vsu-amm-bot
CONTAINER_NAME=vsu-amm-bot-container

echo "🛠️ Сборка Docker образа..."
docker build -t $IMAGE_NAME .

echo "🧹 Остановка и удаление предыдущего контейнера (если есть)..."
docker stop $CONTAINER_NAME 2>/dev/null || true
docker rm $CONTAINER_NAME 2>/dev/null || true

echo "🚀 Запуск нового контейнера..."
docker run -d \
    --name "$CONTAINER_NAME" \
    --env-file .env \
    "$IMAGE_NAME"

echo "✅ Контейнер $CONTAINER_NAME запущен."