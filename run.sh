docker build -t teaching_bot . || { echo "Ошибка сборки образа"; exit 1; }

docker rm -f teaching_bot_container >/dev/null 2>&1 && echo "Контейнер teaching_bot_container удален" || echo "Контейнер teaching_bot_container не существует"

docker run -d --rm --name teaching_bot_container --env-file .env teaching_bot
echo "Новый контейнер teaching_bot_container успешно запущен"