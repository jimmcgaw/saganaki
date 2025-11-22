FROM python:3.11-slim

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

COPY pyproject.toml .
COPY uv.lock .

RUN uv sync

COPY main.py .

ENV UVICORN_HOST="0.0.0.0"
ENV UVICORN_PORT="8000"

CMD ["uv", "run", "uvicorn",  "main:app", "--reload"]