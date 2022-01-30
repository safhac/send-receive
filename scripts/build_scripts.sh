#!/bin/bash
# docker compose up
function dcu() {
  docker-compose up --build -d --force-recreate --remove-orphans
}
# service up
function serup() {
  docker-compose up --remove-orphans -d "$1"
}

# docker build, docker run with network
function build_run_container() {
  docker build --pull --rm -t "$1" .
  docker run --rm -ti --network rabbit_docker_default "$1" "${2:$2}"
}

function build_packages() {
  CWD=$PWD
  services="receiver.service sender.service"
  for service in $services; do
    poetry_init $service
    cd $CWD
  done
}

function poetry_init() {
  cd "./$1"
  TOMLFILE="pyproject.toml"
  if [ -f $TOMLFILE ]; then
    poetry update
  else
    poetry init --name '$1' --version '0.1.0' --description '$1' --author 'Asaf Cohen <https://github.com/safhac>'
  fi
  poetry lock
  poetry build

}
