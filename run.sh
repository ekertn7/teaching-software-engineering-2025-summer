# TODO: заполнить

docker rm -f my_bot_container 2>/dev/null || true

docker build -t my_bot_image .

docker run --name my_bot_container --env-file .env my_bot_image


