# syntax=docker/dockerfile:1
FROM python:3.9.7-slim AS send-compile-img

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY ./ /opt/sender
WORKDIR /opt/sender/
RUN pip install -U pip
RUN pip install pika ./dist/sender-0.1.0-py3-none-any.whl

FROM python:3.9.7-slim AS send-build-img
RUN useradd -mU appuser
COPY --from=send-compile-img --chown=appuser /opt/venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"
CMD ["python", "-m", "sender"]