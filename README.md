# docker microservices send receive to/from rabbitmq running <ubuntu rootless>*rootless*

read more [about running docker rootless](https://docs.docker.com/engine/security/rootless/)
### build distros with poetry
`source ./scripts/build_scripts.sh`\
`build_packages`\
`dcu`
### or run with compose 
`docker-compose up --build -d --force-recreate --remove-orphans` 



- [x] run as individual containers
- [x] run everything using compose
- [x] add packaging (used poetry) 
- [x] add two stage build
- [ ] create an RPC version 2.0  
- [ ] run asynchronously  

---
### _note:_
> package installs are considerably slower than `pip install -r requirements.txt`

---
# Changelog
### [0.1.0] - 2022-30-1
#### Added security using a cached layer
- inspired by [pythonspeed](https://pythonspeed.com/articles/docker-cache-insecure-images/)
- added local distro build scripts 
- removed poetry builds from dockerfile 