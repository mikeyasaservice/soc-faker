FROM ghcr.io/astral-sh/uv:0.12.23 AS uv
FROM python:3.11-slim
COPY --from=uv /uv /uvx /bin/
WORKDIR /app
COPY . .
RUN uv sync --locked --no-dev
CMD ["uv", "run", "--no-sync", "python", "/app/bin/test.py"]
