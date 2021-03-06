 # Consul commands : 

 - With the Consul Server running, we can test Consul's Key-Value Store HTTP API:
Check the status of Consul's Key-Value Store HTTP API (should be empty at this point):

<code>curl "http://212.237.52.79:8500/v1/catalog/service/web"</code>

- Create a test entry in Consul's Key-Value Store:

<code>curl -X PUT -d 'this is a test' "http://212.237.52.79:8500/v1/kv/msg1"</code>

- Retrieve your key value entry from Consul's HTTP API:

<code> curl "http://212.237.52.79:8500/v1/kv/msg1?raw"</code>

- Consul nodes :

<code>curl http://localhost:8500/v1/catalog/nodes</code>

## check agent

<code>curl http://localhost:8500/v1/agent/check/pass/service:http1</code>

## ex with nginx web server and scaling web app
[docker compose example file](https://github.com/yeasy/docker-compose-files/blob/master/consul-discovery/docker-compose.yml)

## Services list

<code>curl http://212.237.52.79:8500/v1/catalog/services</code>

## List nodes in the cluster with the following command:

<code>docker run swarm list consul://$(docker-machine ip consul-machine):8500</code>

## join consul from distant nodes:

<code>eval $(docker-machine env swarm-2)  &&
docker swarm join --advertise=$(docker-machine ip swarm-2) consul://212.237.52.79:8500
</code>

## Refrences

[consul-service-discovery-failure-detection-2](https://blog.eleven-labs.com/fr/consul-service-discovery-failure-detection-2/)
[link2](http://blog.scottlogic.com/2016/06/17/docker-swarm.html)

### Example Sample:

 - (link)[https://codefresh.io/howtos/deploy-docker-compose-v3-swarm-mode-cluster/]
 - (link 2)[https://docs.docker.com/datacenter/ucp/2.2/guides/user/services/#deploy-the-voting-application]

eval $(docker-machine env swarm-1)
docker network create --driver overlay --subnet 10.0.9.0/24 --gateway 10.0.9.99 overlayNet

docker stack deploy --compose-file docker-compose.yml vote_app_stack

leader_ip=$(docker-machine ip swarm-1)
eval $(docker-machine env swarm-3)
docker swarm join --token $worker_join $leader_ip:2377

### Liens utils

[cluster-docker-consul-traefik](https://docs.traefik.io/user-guide/cluster-docker-consul)
[DOCKER REMOTE API : PILOTER UN HÔTE DOCKER À DISTANCE](http://blog.inovia-conseil.fr/?p=215)
[Un bon lien pour faire des tests avec le LB Kota<oda](https://www.katacoda.com/courses/docker-orchestration/load-balance-service-discovery-swarm-mode)
