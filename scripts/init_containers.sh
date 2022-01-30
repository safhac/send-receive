#!/bin/bash
# docker compose up
function dcu() {
  docker-compose up --build -d --force-recreate --remove-orphans
}

# docker build, docker run with network
function build_run_container() {
  docker build --pull --rm -t "$1" .
  docker run --rm -ti --network rabbit_docker_default "$1" "${2:$2}"
}

function poetry_init() {
  cd ../receiver.service
  RECTOMLFILE=./pyproject.toml
  if test -f "$RECTOMLFILE"; then
    poetry init
  else
    poetry init --name "receiver" --version "0.1.0" --description "subscribe to rabbitmq channel" --author "Asaf Cohen <https://github.com/safhac>"
  fi
  poetry lock
  cd ../sender.service
  SENSTOMLFILE=./pyproject.toml
  if test -f "$SENSTOMLFILE"; then
    poetry init
  else
    poetry init --name "sender" --version "0.1.0" --description "send messages to rabbitmq" --author "Asaf Cohen <https://github.com/safhac>"
  fi
  poetry lock
}
export poetry_init
export dcu
export docker_container
export foo
