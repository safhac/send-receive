#!/usr/bin/env python
import pika
from time import sleep

def main():
    connection = pika.BlockingConnection(pika.ConnectionParameters('rabbitmq'))
    channel = connection.channel()
    channel.queue_declare(queue='hello')


    for i in range(20):
        channel.basic_publish(exchange='',
                              routing_key='hello',
                              body=f'Hello {i}')
        sleep(1)

    print('closing connection')
    connection.close()

if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print('Interrupted')
        try:
            sys.exit(0)
        except SystemExit:
            os._exit(0)