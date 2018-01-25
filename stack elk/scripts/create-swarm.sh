#!/bin/bash


read -p "Please enter Prefix node name (default=node)" -t 10 prefix_node_name
prefix_node_name=${prefix_node_name:-node_}
read -p "Please enter Total nodes count (default=3)" -t 10 total_node_count
total_node_count=${total_node_count:-3}
read -p "Please enter Driver (default=virtualbox)" -t 10 driver
driver=${driver:-virtualbox}
read -p "Please enter Master node count (default=1)" -t 10 master_node_count
master_node_count=${master_node_count:-1}

# echo "prefix_node_name : $prefix_node_name"
# echo "total_node_count : $total_node_count"
# echo "driver : $driver"
# echo "master_node_count : $master_node_count"

# Creating 6 nodes 
echo "### Creating nodes ..."
for c in $(seq 1 $((total_node_count))); do
    echo "Creating node $prefix_node_name-$c with driver $driver"
    docker-machine create -d $driver $prefix_node_name-$c
done

# Get IP from leader node
leader_ip=$(docker-machine ip $prefix_node_name-1)
echo "Leader node IP : $leader_ip"

# Init Docker Swarm mode
echo "### Initializing Swarm mode ..."
eval $(docker-machine env prefix_node_name-1)
docker swarm init --advertise-addr $leader_ip

# Swarm tokens
manager_token=$(docker swarm join-token manager -q)
worker_token=$(docker swarm join-token worker -q)

# Joinig manager nodes
echo "### Joining manager $master_node_count modes ..."
for c in $(seq 2 $((master_node_count))); do
    eval $(docker-machine env $prefix_node_name-$c)
    docker swarm join --token $manager_token $leader_ip:2377
done

# Join worker nodes
echo "### Joining worker modes ..."
for c in $(seq $master_node_count $total_node_count); do
    eval $(docker-machine env $prefix_node_name-$c)
    docker swarm join --token $worker_token $leader_ip:2377
done

# Clean Docker client environment
echo "### Cleaning Docker client environment ..."
eval $(docker-machine env -u)

exit 0
