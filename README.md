**DOCKER SWARM Install HYPER-V**
============================

1. Create Workers machines
   - For windows :
     * SET UP A NEW EXTERNAL NETWORK SWITCH : [[LINK](https://docs.docker.com/machine/drivers/hyper-v/#1-make-sure-hyper-v-is-enabled)]
     * Docker machine creation
       * <code>docker-machine create -d hyperv --hyperv-virtual-switch "Primary Virtual Switch" worker1</code>
2. Create Leader SWARM machine:
   - Create   
     * <code>docker-machine create -d hyperv --hyperv-virtual-switch "Primary Virtual Switch" leader1</code>
     
   - Init swarm
      * <code>docker-machine ssh</code>
      * <code>ip addr show (for getting the right IP address)</code>
      * <code>docker swarm init --advertise-addr=10.0.52.83</code>
 
3. Join machines workers to SWARM
   - SSH Connection to machines
     * <code>docker-machine ssh worker1</code>
     * <code>docker swarm join --token SWMTKN-1-1lbtkl0ga7puka3vs9gn489lvf991k4iij72jz3jvanrkgnxok-3b7r8m8afewuomyhiej4rf8do 10.0.52.83:2377</code>
   -  Command for leaving a swarm :
     * <code>docker swarm leave --force</code>
   - Display nodes
     * <code>docker node ls</code>

4. Install [docker-swarm-visualizer](https://github.com/dockersamples/docker-swarm-visualizer)
   * docker service create --name=visualizer --publish=8080:8080/tcp --constraint=node.role==manager --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock dockersamples/visualizer
		
5. Create an overlay network
   - Network:
      * <code> docker network ls</code>
   - Command:
      * <code>docker network create --driver overlay my-network</code>
   - Network inspection
      * <code>docker network inspect my-network</code>

6. Install services on swarm mode:
   - Services list:
     * <code>docker service ls</code>
     * Install new service (ex: une image alpine ):
       * <code>docker service create --replicas 1 --name helloworld alpine ping docker.com</code>

7. Scaling

8. Docker Stack commands:
   - Deploy:
      * docker stack deploy --compose-file docker-compose.yml **stackName**
   - Services list:
      * docker stack services **stackName**
   - Bring the stack down:
      * docker stack rm **stackName**
   - Bring the registry down:
      * docker stack rm registry
   - Bring the docker Engine out of swarm mode
      * docker swarm leave --force

# Docker Networking

### Virtual IP address 
<p>Now, if another service or discrete container wanted to consume the nginx service, how will it address the service?</p>
<p>Swarm has this covered, and allocates each service that gets created a virtual IP address through which it can be addressed. If we inspect the nginx service, we can see the virtual IP address:</p>
<code>$ docker service inspect --format '{{json .Endpoint.VirtualIPs}}' nginx | jq '.'
[
  {
    "NetworkID": "4pnw0biwjbns0bjg4ey6cepri",
    "Addr": "192.168.35.2/24"
  }
]</code>

**La communication inter-services doit être faite par les ip virtuelles**

### Embedded DNS Server

<p>Each Docker engine runs an embedded DNS server, which can be queried by processes running in containers on a specific Docker host, provided that the containers are attached to user-defined networks (i.e. Note: not the default bridge network, called bridge). Container and Swarm service names can be resolved using the embedded DNS server, provided the query comes from a container attached to the same network as the container or service being looked up</p>

<p>In our scenario, we can use the service name, nginx, instead of the virtual IP address, to consume the service. The name will be resolved to the virtual IP address, and the service request will be routed to one of the task containers running in the cluster. </p>

# Various

### Certif problem and ssh unavailable

   <code>rm -R ~/.docker</code>
   <code>docker-machine --debug regenerate-certs -f worker1</code>

### Machine environment
   docker-machine env worker3

### Getting the token to join swarm command
   <code>docker swarm join-token worker</code>

### A FAIRE :   es + docker beat + Consul *
[LINK](https://github.com/mcascallares/es-demo-cluster/blob/master/docker-compose.yml)

### [Service discovery CONSUL](https://blog.eleven-labs.com/fr/consul-service-discovery-failure-detection-2/)

### [Swarm consul Traeffic](http://blog.wescale.fr/2017/01/04/tutoriel-infastructure-resiliente-et-scalable-avec-swarm-consul-et-traefik/)

### ERRORS : This machine has been allocated an IP address, but Docker Machine could not reach it successfully. SSH for the machine should still work, but connecting to exposed ports, such as the Docker daemon port
  - sudo ifconfig vboxnet0 down && sudo ifconfig vboxnet0 up
