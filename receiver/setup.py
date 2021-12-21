from setuptools import setup

setup(
    name='receiver',
    version='0.1.0',
    packages=['receiver'],
    install_requires=[
        'pika',
        'python_version == "3.9"',
    ],
)