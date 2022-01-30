# syntax=docker/dockerfile:1
FROM python:3.9.7-slim AS rec-compile-img

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY ./ /opt/receiver
WORKDIR /opt/receiver/
RUN pip install -U pip
RUN pip install pika ./dist/receiver-0.1.0-py3-none-any.whl

FROM python:3.9.7-slim AS rec-build-img
RUN useradd -mU appuser
COPY --from=rec-compile-img --chown=appuser /opt/venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"
RUN pip list
#CMD ["python", "-m", "receiver.receive"]