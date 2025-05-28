#!/bin/bash


docker rm -f my_uv_app_container 2>/dev/null || true


docker build -t my_uv_app_image .


docker run --name my_uv_app_container --env-file .env my_uv_app_image
