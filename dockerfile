# TODO: заполнить

FROM python:3.13.3-bullseye

WORKDIR /app

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

COPY .python-version .
COPY pyproject.toml .
COPY uv.lock .

RUN uv sync --no-dev --frozen

COPY . .

CMD ["uv", "run", "main.py"]