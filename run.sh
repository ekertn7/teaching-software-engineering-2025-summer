docker rm -f "bot_container"
docker build -t our_vsu_bot_image -f ./dockerfile .
docker run -d --name "bot_container" our_vsu_bot_image 