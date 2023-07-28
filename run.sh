#!/bin/bash

docker run -d --rm \
       --name pihole \
       -p 5353:53/tcp -p 5353:53/udp \
       -p 80:80 \
       -e TZ="Australia/Sydney" \
       --dns=127.0.0.1 --dns=1.1.1.1 \
       --hostname pihole \
       -e VIRTUAL_HOST="pihole" \
       -e PROXY_LOCATION="pihole" \
       -e FTLCONF_LOCAL_IPV4="127.0.0.1" \
       custom-pihole:latest

# -v host_path:/etc/pihole
# -v host_path:/etc/dnsmasq.d
# --restart=unless-stopped
