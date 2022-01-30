# docker microservices send receive to/from rabbitmq running <ubuntu rootless>*rootless*

read more [about running docker rootless](https://docs.docker.com/engine/security/rootless/)
### run with compose 
`docker-compose up --build -d --force-recreate --remove-orphans`

- [x] run as individual containers
- [x] run everything using compose
- [x] add packaging (used poetry) 
- [ ] add two stage build
- [ ] run asynchronously  

---
### _note:_
> package installs are considerably slower than `pip install -r requirements.txt`
