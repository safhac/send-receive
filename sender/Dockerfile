FROM python:3.9-slim
RUN useradd --create-home appuser
USER appuser
ENV PATH="/home/appuser/.local/bin:$PATH"
RUN pip install --user -U pip
RUN pip install --user pika
WORKDIR /sender
COPY . .
CMD ["python", "-m", "send"]