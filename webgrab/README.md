# WebGrab AND Filebeat

## TODO

- [x] Install [docker-WebGrab](https://github.com/linuxserver/docker-webgrabplus)
- [x] Add configs
- [x] Push data to git (tar format)
- [ ] Install and config FileBeat to log sitepack channels to elastic
- [ ] Test docker-compose [config](https://docs.docker.com/compose/compose-file/#long-syntax)
- [ ] NFS ochrestration (find the right and the best storage orchestrator)
- [x] Install and use nfs
- [x] Auto update sitepack

## Brain teaser

- Filebeat all sitepack

## install

docker plugin install rexray/efs \
  EFS_ACCESSKEY=xxx \
  EFS_SECRETKEY=xxx \
  EFS_SECURITYGROUPS="admin" \
  EFS_TAG=rexray
