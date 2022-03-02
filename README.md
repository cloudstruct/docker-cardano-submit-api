# docker-cardano-submit-api
Wrapper Dockerfile

This uses binaries from Armada Alliance. While we're alliance members and have
trust in the people providing the binaries, don't use this anywhere near your
pool's keys. ;-)

## Usage
If you've gotten this far, might as well go for it.

```
docker run --detach \
  --name cardano-submit-api \
  -v /path/to/config:/data/config \
  -v /path/to/cardano-node/socket:/data/ipc/node.socket \
  cloudstruct/cardano-submit-api \
  --socket-path /data/ipc/node.socket \
  --mainnet --port 8090 \
  --listen-address 0.0.0.0 \
  --config /data/config/tx-submit-mainnet-config.yaml
```
