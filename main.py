#!./.venv/bin/python

import asyncio
import logging
from aiogram import Dispatcher

from src.bot import bot
from src.start import router as strart_router
from src.mark import router as mark_router
from src.llm import router as llm_router


logging.basicConfig(level=logging.INFO)


dp = Dispatcher()
dp.include_routers(
    strart_router,
    mark_router,
    llm_router,
)


async def main():
    await dp.start_polling(bot)


if __name__ == "__main__":
    asyncio.run(main())
