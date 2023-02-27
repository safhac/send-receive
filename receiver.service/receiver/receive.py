#!/usr/bin/env python
import pika, sys, os


def main():

    connection = pika.BlockingConnection(pika.ConnectionParameters(host="rabbitmq"))
    channel = connection.channel()
    channel.queue_declare(queue="hello", durable=True)

    def callback(ch, method, properties, body):
        print(" [x] Received %r" % body)

    channel.basic_consume(queue="hello", auto_ack=True, on_message_callback=callback)

    print(" [*] Waiting for messages. To exit p ress CTRL+C")
    channel.start_consuming()


if __name__ == "__main__":
    try:
        print("starting receiver")
        main()
    except KeyboardInterrupt:
        print("Interrupted")
        try:
            sys.exit(0)
        except SystemExit:
            os._exit(0)
