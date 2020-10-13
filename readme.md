# dcagatay/env-haproxy

Environment variable configurable HAProxy image for quick usage with K8s or Docker. You can find sample configuration on `docker-compose.yml`. This image is based on [haproxy:2.2-alpine](https://hub.docker.com/_/haproxy)

Note that all HAProxy configuration options are not covered just basic ones. You can easily build your own image with options you need on Jinja2 template file `haproxy.cfg.j2`.

**Basic Config:**

- `LB_TYPE`: Proxy type for HAProxy. `TCP` or `HTTP` Default: `TCP`
- `BIND_PORT`: The port HAProxy binds to. ` Default: `80`
- `LB_SERVER_{n}`: Enumerated service address (`server:port`). `n` starts from *1*. Default: `whoami:8000`

**Advanced Config:**

- `NUM_SERVERS`: Default: `100`
- `BALANCE_ALGORITHM`: Balance algorithm for HAProxy. Check HAProxy config for other choices. Common choices: `roundrobin`, `leastconn`, `first`, etc. Default: `roundrobin`

## Building your own config

```sh
docker-compose build
```
