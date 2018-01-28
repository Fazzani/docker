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

## Refrences

[consul-service-discovery-failure-detection-2](https://blog.eleven-labs.com/fr/consul-service-discovery-failure-detection-2/)
