IMAGE_NAME=my-bot
CONTAINER_NAME=my-bot-container

docker build -t $IMAGE_NAME .

docker rm -f $CONTAINER_NAME 2>/dev/null

docker run --name $CONTAINER_NAME --env-file .env $IMAGE_NAME