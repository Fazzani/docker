# WebGrab AND Filebeat

## TODO

- [ ] Install [docker-WebGrab](https://github.com/linuxserver/docker-webgrabplus)
- [ ] Add configs
- [ ] Push data to git (tar format)
- [ ] Install and config FileBeat to log sitepack channels to elastic
- [ ] Auto update sitepack
- [ ] Test docker-compose [config](https://docs.docker.com/compose/compose-file/#long-syntax)
- [ ] NFS ochrestration (find the right and the best storage orchestrator)
- [x] Install and use nfs

## Brain teaser

- Bash to get the webGrab.config and launching grabbing
- Bash to zip and push to xmltv
- Filebeat all sitepack

## install

docker plugin install rexray/efs \
  EFS_ACCESSKEY=xxx \
  EFS_SECRETKEY=xxx \
  EFS_SECURITYGROUPS="admin" \
  EFS_TAG=rexray