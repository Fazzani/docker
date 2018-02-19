# Reste à faire

## services swarm to install

- [ ] Emby
- [ ] Rancher
- [ ] Elk and Filebeat (elastic data scaled on 2 instances) [EXAMPLE SWARM ELK](https://github.com/ahromis/swarm-elk)
- [ ] MySQL
- [ ] Reverse proxy and LB (traefik)
- [ ] RabbitMQ scale on 2 instances
- [ ] WebGrab Synker from commands
- [ ] Redis
- [ ] [Dockbeat](https://github.com/Ingensi/dockbeat) to monitor and log docker deamon into elasticsearch
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
- [ ] Rex-ray (google cloud storage 5G,  Ceph, GlusterFS, Network File System (NFS))

## Docker machines

- Aws1  : 18.194.42.216      Master    micro
- OVH1  : 151.80.235.155     Master    large
- Arub  : 212.237.52.79      Worker    micro
- OVH2  : 145.239.198.33     Worker    medium
- gcp1  : 35.203.139.243     Worker    micro
- Rasp1 : 82.227.224.28      Worker    micro

## Create Swarm by Ansible

- [ ] [Create Swarm by Ansible](https://thisendout.com/2016/09/13/deploying-docker-swarm-with-ansible/)
- [ ] WebGrab
- [ ] ALL custom scripts and crontab