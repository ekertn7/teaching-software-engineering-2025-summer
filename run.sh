
docker build -t test_bot .

docker rm -f test_bot_container 2>/dev/null || true

docker run -d -rm --name test_bot_container --env-file .env test_bot