# WebGrab AND Filebeat

## TODO

- [ ] Install and use GlusterFs
- [ ] Install [docker-WebGrab](https://github.com/linuxserver/docker-webgrabplus)
- [ ] Add configs
- [ ] Push data to git (tar format)
- [ ] Install and config FileBeat to log sitepack channels to elastic
- [ ] Auto update sitepack
- [ ] Test docker compose [config](https://docs.docker.com/compose/compose-file/#long-syntax)

## install

docker plugin install rexray/efs \
  EFS_ACCESSKEY=xxx \
  EFS_SECRETKEY=xxx \
  EFS_SECURITYGROUPS="admin" \
  EFS_TAG=rexray
