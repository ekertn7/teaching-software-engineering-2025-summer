#!./.venv/bin/python

import asyncio
import logging
import requests
from aiogram import Bot, Dispatcher, types, Router
from aiogram.filters import Command

from config import settings


logging.basicConfig(level=logging.INFO)


bot = Bot(token=settings.token)
dp = Dispatcher()


def request_to_ollama(prompt: str) -> str:
    response = requests.post(
        url="http://192.168.0.23:9999/api/generate",
        json={
            # "model": "llama3.2:1b",
            "model": "phi4:14b",
            "prompt": prompt,
            "stream": False,
            # "format": "json",
            "options": {
                "temperature": 0,
                "seed": 123,
            },
        },
    )

    if response.status_code != 200:
        return "Упс! Что-то пошло не так..."

    return response.json()["response"]


@dp.message()
async def handle_message(message: types.Message):

    print(message.from_user.id, message.from_user.username)

    if message.text:

        answer = request_to_ollama(prompt=message.text)

        # with open("otmetki.txt", "a", encoding="utf-8") as file:
        #     file.write(f"{message.text}\n")
        #     file.close()

        await bot.send_message(
            chat_id=message.chat.id,
            text=answer,
            reply_to_message_id=message.message_id,
        )

    elif message.sticker:

        await bot.send_sticker(
            chat_id=message.chat.id,
            sticker=message.sticker.file_id,
            reply_to_message_id=message.message_id,
        )

    else:
        await bot.send_message(
            chat_id=message.chat.id,
            text="Неподдерживаемый тип сообщения",
        )


async def main():
    await dp.start_polling(bot)


if __name__ == "__main__":
    asyncio.run(main())
