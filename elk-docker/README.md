# TODO

## services swarm to install

- [ ] Emby
- [ ] Rancher
- [ ] Elk and Filebeat (elastic data scaled on 2 instances) [ex 1][ex_elk2] [ex 2][ex_elk]
  - [ ] [logstash config][link_logstash_config]
- [ ] MySQL
- [ ] Reverse proxy and LB [traefik][ex_traefik]
- [ ] RabbitMQ scale on 2 instances
- [ ] WebGrab Synker from commands [docker version](https://github.com/linuxserver/docker-webgrabplus)
- [ ] Redis
- [ ] [Dockbeat](https://github.com/Ingensi/dockbeat) to monitor and log docker deamon into elasticsearch
- [ ] Install [Tvheadend]
- [ ] Synker
  - [ ] WebApi       scale on 2 instances
  - [ ] WebClient    scale on 2 instances
  - [ ] Batch
  - [ ] Broker

## Others

- [ ] Restore crontab and incrontab
- [ ] Restore Synker database
- [ ] Fix auto deploy for appveyor and travis ci
- [ ] Restore Filebeat and Logstash configurations
- [ ] Rex-ray (google cloud storage 5G, Ceph, GlusterFS, Network File System (NFS))
- [ ] SSL Elk communication AND [keystore][keystore_logstash]
- [ ] Fix [NetShare][NetShare] plugin

### To test

* [filebeat][filebeat]
* [heartbeat][heartbeat]
* [metricbeat][metricbeat]
* [packetbeat][packetbeat]

## Create Swarm by Ansible

- [ ] [Create Swarm by Ansible](https://thisendout.com/2016/09/13/deploying-docker-swarm-with-ansible/)
- [ ] WebGrab
- [ ] ALL custom scripts and crontab

## Docker Stack

For elasticsearch to not give Out of Memory errors, we need set vm.max_map_count of the kernel of VMs to atleast 262144. To do this, run the following commands.

```shell

docker-machine ssh manager sudo sysctl -w vm.max_map_count=262144
docker-machine ssh agent1 sudo sysctl -w vm.max_map_count=262144
docker-machine ssh agent2 sudo sysctl -w vm.max_map_count=262144

```

## Docker machines

- OVH1  : 151.80.235.155     Master    large
- OVH2  : 145.239.198.33     Worker    medium
- Aws1  : 18.194.42.216      Master    small
- Arub  : 212.237.52.79      Worker    small
- gcp1  : 35.203.139.243     Worker    small
- Rasp1 : 82.227.224.28      Worker    small

[beats]: https://www.elastic.co/products/beats
[elastic]: https://www.elastic.co/
[filebeat]: https://www.elastic.co/guide/en/beats/filebeat/current/running-on-docker.html
[heartbeat]: https://www.elastic.co/guide/en/beats/heartbeat/current/running-on-docker.html
[metricbeat]: https://www.elastic.co/guide/en/beats/metricbeat/current/running-on-docker.html
[packetbeat]: https://www.elastic.co/guide/en/beats/packetbeat/current/running-on-docker.html
[Tvheadend]:https://github.com/linuxserver/docker-tvheadend
[ex_traefik]:https://zerokspot.com/weblog/2017/09/03/docker-stacks-for-local-development/
[ex_elk]:https://github.com/elastic/stack-docker/blob/master/docker-compose.yml
[ex_elk2]:https://github.com/ahromis/swarm-elk
[link_logstash_config]:https://www.elastic.co/guide/en/logstash/5.5/docker.html
[keystore_logstash]:https://www.elastic.co/guide/en/logstash/current/keystore.html
[NetShare]:(http://netshare.containx.io/docs/getting-started)