# docker compose up
function dcu(){
    docker-compose up --build -d --force-recreate --remove-orphans
}

# docker build, docker run with network
function build_run_container(){
    docker build --pull --rm -t "$1" .
    docker run --rm -ti --network rabbit_docker_default "$1"
}
export docker_container