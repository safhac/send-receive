# docker microservices send receive to/from rabbitmq running <ubuntu rootless>*rootless*

read more [about running docker rootless](https://docs.docker.com/engine/security/rootless/)
### initiate rabbitmq 
```
`docker run --rm -ti -d --name rabbitmq -p 15672:15672 -p 5672:5672 rabbitmq:3.8.1-management`

```
inspect rabbitmq for the actual network name
> 
### initiate receiver and then sender
```
`source ./init_containers`

`build_run_container receiver`

`build_run_container sender`
```
https://github.com/octo-org/octo-repo/issues/740

- [x] run as individual containers
- [x] run everything using compose
- [ ] add two stage build to reduce attack surface
- [ ] run asynchronously  