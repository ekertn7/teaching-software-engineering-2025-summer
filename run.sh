IMAGE_NAME="my-bot-image"
CONTAINER_NAME="my-bot-container"

docker build -t $IMAGE_NAME .

docker rm -f $CONTAINER_NAME 2>/dev/null || true

docker run -d \
  --name $CONTAINER_NAME \
  --env-file .env \
  --restart unless-stopped \
  $IMAGE_NAME

echo "Бот успешно запущен в контейнере $CONTAINER_NAME"
