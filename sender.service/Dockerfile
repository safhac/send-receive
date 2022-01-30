# syntax=docker/dockerfile:1
FROM python:3.9-slim AS send-compile-img

RUN useradd --create-home appuser
USER appuser
ENV PATH="/home/appuser/.local/bin:$PATH"
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN /usr/local/bin/python -m pip install pika poetry
WORKDIR /sender
COPY . .
RUN poetry install
CMD ["poetry", "run", "python", "-m", "sender.send"]