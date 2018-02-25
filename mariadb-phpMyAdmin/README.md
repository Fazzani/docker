Mariadb Docker Swarm
============

This is an example only and may not be production-quality.

```sh

mkdir -p .secrets
openssl rand -base64 32 > .secrets/xtrabackup_password
openssl rand -base64 32 > .secrets/mysql_password
openssl rand -base64 32 > .secrets/mysql_root_password
docker stack deploy -c docker-compose.yml galera

```
