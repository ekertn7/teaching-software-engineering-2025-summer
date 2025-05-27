from aiogram import types, Router
from aiogram.filters import Command

from src.bot import bot


router = Router()


@router.message(Command(commands=["start"]))
async def handle_start(message: types.Message):
    await bot.send_message(
        chat_id=message.chat.id,
        text=(
            "Вы попали в бота, который использует языковую модель для генерации ответов. "
            "Можете отправить сообщение и убедиться в этом самостоятельно."
        )
    )
