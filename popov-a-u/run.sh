APP_IMAGE="telegram-bot-image"
APP_CONTAINER="telegram-bot-container"

docker build -t $APP_IMAGE .

docker rm -f "$APP_CONTAINER" 2>/dev/null

docker run -d \
    --name "$APP_CONTAINER" \
    --env-file .env \
    "$APP_IMAGE"

echo "Готово! Контейнер $APP_CONTAINER запущен"