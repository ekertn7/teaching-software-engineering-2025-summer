import requests
from aiogram import types, Router
from aiogram.filters import Command

from src.bot import bot


router = Router()


@router.message()
async def handle_message(message: types.Message):

    if message.text:
        answer = request_to_llm(prompt=message.text)
        await bot.send_message(
            chat_id=message.chat.id,
            text=answer,
            reply_to_message_id=message.message_id,
        )
    else:
        await bot.send_message(
            chat_id=message.chat.id,
            text="Неподдерживаемый тип сообщения!",
        )


def request_to_llm(prompt: str) -> str:
    response = requests.post(
        url="http://192.168.0.23:9999/api/generate",
        json={
            # "model": "llama3.2:1b",
            "model": "phi4:14b",
            "prompt": prompt,
            "stream": False,
            "options": {
                "temperature": 0,
                "seed": 123,
            },
        },
    )

    if response.status_code != 200:
        return "Упс! Что-то пошло не так..."

    return response.json()["response"]
