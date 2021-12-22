FROM python:3.9-slim
RUN useradd --create-home appuser
USER appuser
ENV PATH="/home/appuser/.local/bin:$PATH"
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN /usr/local/bin/python -m pip install pika poetry
WORKDIR /receiver
COPY . .
CMD ["poetry", "install"]
CMD ["python", "-m", "receive"]