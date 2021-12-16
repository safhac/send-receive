FROM python:3.9-slim
RUN useradd --create-home appuser
USER appuser
RUN pip install --user -U pip
RUN pip install --user pika
WORKDIR /receiver
COPY . .
CMD ["python", "-m", "receive"]