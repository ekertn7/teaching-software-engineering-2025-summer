# TODO: заполнить
#!/bin/bash

# Проверка Docker
if ! command -v docker &> /dev/null; then
    echo "❌ Ошибка: Docker не установлен. Установите Docker и повторите."
    exit 1
fi

# Проверка .env
if [ ! -f .env ]; then
    echo "❌ Ошибка: .env не найден! Создайте его на основе .env.example."
    exit 1
fi

# Сборка образа
echo "🛠️ Собираем Docker образ..."
docker build -t telegram-bot .

# Остановка старого контейнера (если есть)
echo "🛑 Останавливаем старый контейнер..."
docker stop telegram-bot-container 2>/dev/null
docker rm telegram-bot-container 2>/dev/null

# Запуск нового контейнера
echo "🚀 Запускаем бота..."
docker run --env-file .env --name telegram-bot-container -d telegram-bot

echo "✅ Готово! Бот запущен в контейнере."
echo "🔍 Логи: docker logs telegram-bot-container -f"