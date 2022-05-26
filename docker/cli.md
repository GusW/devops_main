### RabbitMQ

```bash
docker run \
    --hostname <hostname> \
    --name <name> \
    -p 5672:5672 \
    rabbitmq:3.9
```

### RabbitMQ management

```bash
docker run -d \
    --hostname <hostname> \
    --name <name> \
    -e RABBITMQ_DEFAULT_USER=<user> \
    -e RABBITMQ_DEFAULT_PASS=<password> \
    -p 15672:15672 \
    -p 5672:5672 \
    rabbitmq:3.9-management
```
