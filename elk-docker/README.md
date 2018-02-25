# TODO

## services swarm to install

- [ ] Emby
- [ ] Rancher
- [ ] Elk and Filebeat (elastic data scaled on 2 instances) [ex 1][ex_elk2] [ex 2][ex_elk] [ex 3][elk_3]
  - [ ] [logstash config][link_logstash_config]
- [ ] MySQL
- [ ] Reverse proxy and LB [traefik][ex_traefik]
- [ ] RabbitMQ scale on 2 instances
- [x] WebGrab Synker from commands [docker version](https://github.com/linuxserver/docker-webgrabplus)
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
- [ ] Rex-ray (google cloud storage 5G, Ceph, GlusterFS, Network File System (NFS))
- [ ] SSL Elk communication AND [keystore][keystore_logstash]
- [x] Restore Filebeat and Logstash configurations
- [x] Fix [NetShare][NetShare] plugin

### To test

* [filebeat][filebeat]
* [heartbeat][heartbeat]
* [metricbeat][metricbeat]
* [packetbeat][packetbeat]

## Create Swarm by Ansible

- [ ] [Create Swarm by Ansible](https://thisendout.com/2016/09/13/deploying-docker-swarm-with-ansible/)
- [ ] WebGrab
- [ ] ALL custom scripts and crontab
- [ ] Auto creating nfs volumes

## Docker Stack

For elasticsearch to not give Out of Memory errors, we need set vm.max_map_count of the kernel of VMs to atleast 262144. To do this, run the following commands.

```shell

docker-machine ssh manager sudo sysctl -w vm.max_map_count=262144
docker-machine ssh agent1 sudo sysctl -w vm.max_map_count=262144
docker-machine ssh agent2 sudo sysctl -w vm.max_map_count=262144

```

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
[NetShare]:http://netshare.containx.io/docs/getting-started
[elk_3]:https://github.com/elastic/examples/blob/master/Miscellaneous/docker/full_stack_example/docker-compose-linux.yml