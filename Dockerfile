FROM haproxy:2.2-alpine

ENV NUM_SERVERS "100"
ENV LB_TYPE "TCP"
ENV BIND_PORT "80"
# LB_SERVER_1 to LB_SERVER_{NUM_SERVERS}
ENV LB_SERVER_1 "whoami:8000"
ENV BALANCE_ALGORITHM "roundrobin"

WORKDIR /app

COPY requirements.txt /app
RUN apk --no-cache add py3-pip && \
    pip3 install -r requirements.txt

COPY haproxy.cfg.j2 /app/

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]