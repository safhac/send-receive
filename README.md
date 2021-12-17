## send receive to/from rabbitmq container  
### initiate rabbitmq 
`docker run --rm -ti -d --name rabbitmq -p 15672:15672 -p 5672:5672 rabbitmq:3.8.1-management`

### initiate receiver and then sender
`source ./initiate_containers`
`docker_container receiver`
`docker_container sender`
