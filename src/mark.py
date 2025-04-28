from aiogram import types, Router
from aiogram.filters import Command

from src.bot import bot


router = Router()


@router.message(Command(commands=["mark"]))
async def handle_mark(message: types.Message):

    with open("otmetki.txt", "a", encoding="utf-8") as file:
        file.write(f"{message.text.strip('/mark ')}\n")
        file.close()

    await bot.send_message(
        chat_id=message.chat.id,
        text="Вы отметились!",
    )
