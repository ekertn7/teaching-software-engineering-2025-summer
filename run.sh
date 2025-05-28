# TODO: заполнить

docker rm -f tg_bot_container 2>/dev/null || true
docker build -t tg_bot .
docker run -d --name tg_bot_container --env-file .env tg_bot