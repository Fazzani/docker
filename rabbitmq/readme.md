# RabbitMQ + HaProxy

## Docker compose RabbitMQ configuration

1 - Possible Volumes to persist server data:

    - RABBITMQ_CONFIG_FILE : The path to the configuration file, without the .config extension. If the configuration file is present it is used by the server to configure RabbitMQ components. See Configuration guide for more information.
    - RABBITMQ_LOG_BASE : This base directory contains the RabbitMQ server's log files, unless RABBITMQ_LOGS or RABBITMQ_SASL_LOGS are set explicitly.
    - RABBITMQ_MNESIA_BASE : This base directory contains sub-directories for the RabbitMQ server's node database, message store and cluster state files, one for each node, unless RABBITMQ_MNESIA_DIR is set explicitly. It is important that effective RabbitMQ user has sufficient permissions to read, write and create files and subdirectories in this directory at any time.

## Création d'un exchange

Un exchange (échange) est l'endroit où un message est déposé par un producteur. A partir de là, le message sera dirigé vers une ou des queues de destination où il sera stocké jusqu'à sa consommation par un ou des consommateurs.

Le chemin pris par le message sera défini grâce aux bindings (liaisons) qui sont définies entre un exchange et une/des queue(s).

Il y a plusieurs types d'exchange : direct, fanout, topic.

### Fanout

Le type d'exchange fanout caractérise une relation de communication 1:n, c'est-à-dire que pour un message envoyé, tous les consommateurs recevront ce message.
Ce type d'exchange ne définit pas de routing key au sein de ses messages. L'exchange aiguille donc les messages à toutes les queues auxquelles il est attaché.

### Direct

Le type d'exchange direct caractérise une relation de communication 1:1, c'est-à-dire que pour un message envoyé, un unique consommateur recevra ce message.
Le fonctionnement de cet exchange est simple. Le message, envoyé par le producteur, contient une routing key. Cette clé est une simple string qui indique le type de routage. Dans ce type d'exchange, le binding spécifie une binding key, et alors l'exchange aiguille le message à une de ces queues attachées, si la routing key correspond à l'identique à la binding key.

### Topic

Le type d'exchange topic caractérise une relation de communication 1:n, c'est-à-dire que pour un message envoyé, plusieurs consommateurs recevront ce message.
Le fonctionnement de cet exchange est similaire à celui du direct exchange, sauf que les bindings keys sont représentées par des caractères wildcard ("*","#"). Le routage des messages par l'exchange se fait encore par la correspondance entre la routing key et la binding key. Au contraire du principe du direct exchange, un message peut être stocké dans plusieurs queues grâce à l'utilisation de wildcard.

## Various

### Glue with docker-compose

``` yaml
rabbitmq:
  image: rabbitmq:3-management
  container_name: rabbit1
  hostname: "rabbit1"
  environment:
    RABBITMQ_ERLANG_COOKIE: "HJKLSDFGHJKLMBZSFXFZD"
    RABBITMQ_DEFAULT_USER: "rabbitmq"
    RABBITMQ_DEFAULT_PASS: "rabbitmq"
    RABBITMQ_DEFAULT_VHOST: "/"
  ports:
    - "15672:15672"
    - "5672:5672"
  labels:
    NAME: "rabbit1"
  volumes:
    - "./rabbitmq/enabled_plugins:/etc/rabbitmq/enabled_plugins"
    - "./rabbitmq/rabbitmq.config:/etc/rabbitmq/rabbitmq.config:rw"
    - "./rabbitmq/definitions.json:/etc/rabbitmq/definitions.json:rw"
    - "./volumes/rabbitmq/rabbit1/data:/var/lib/rabbitmq:rw"
```

[Useful docker compose link](https://github.com/pardahlman/docker-rabbitmq-cluster)