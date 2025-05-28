docker build -t our_vsu_bot_image -f ./dockerfile .
docker rm -f "vsu_bot_container"
docker run -d --name "vsu_bot_container" our_vsu_bot_image 