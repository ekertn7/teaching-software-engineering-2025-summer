import aiohttp
import requests
from aiogram import types, Router
from aiogram.filters import Command

from src.bot import bot


router = Router()


@router.message()
async def handle_message(message: types.Message):

    if message.text:
        answer = await aio_request_to_llm(prompt=message.text)
        # answer = s_request_to_llm(prompt=message.text)
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


async def aio_request_to_llm(prompt: str) -> str:
    uri = "http://192.168.0.23:9999/api/generate"

    payload = {
        "model": "phi4:14b",
        "prompt": prompt,
        "stream": False,
        "options": {
            "temperature": 0,
            "seed": 123,
        },
    }

    async with aiohttp.ClientSession() as session:
        async with session.post(url=uri, json=payload) as response:

            if response.status != 200:
                result = {"response": "Ошибко"}
            else:
                result = await response.json()

    return result["response"]


def s_request_to_llm(prompt: str) -> str:
    response = requests.post(
        url="http://192.168.0.23:9999/api/generate",
        json={
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
