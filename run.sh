docker build -t telegram_bot .

docker rm -f telegram_bot_container 2>/dev/null || true

docker run -d --rm --name telegram_bot_container --env-file .env telegram_bot

echo "Бот успешно запущен в контейнере telegram_bot_container"
