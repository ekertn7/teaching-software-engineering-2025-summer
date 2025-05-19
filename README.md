# Проект по разворачиванию пайплайна на курсе программной инженерии

# Как запустить в Docker

`docker build -t our_vsu_bot_image -f ./dockerfile .`  
`docker run --detach our_vsu_bot_image`

# Как запустить локально

> **Требуется Python 3.13**

```
git clone
python3.13 -m venv venv
. venv/bin/activate
pip install -r requirements.txt
./main.py
```
