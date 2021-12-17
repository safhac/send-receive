function docker_container(){
    docker build --pull --rm -t "$1" .
    docker run --rm -ti --network rabbit_docker_default "$1"
}
export docker_container