FROM pihole/pihole:latest

COPY dont-reset-password-on-boot.patch /tmp/dont-reset-password-on-boot.patch

RUN apt update && \
    apt upgrade --yes && \
    apt install -y patch unbound && \
    patch /usr/local/bin/_startup.sh /tmp/dont-reset-password-on-boot.patch && \
    apt remove -y patch && \
    apt autoremove --yes && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/services.d/unbound
COPY pi-hole.conf /etc/unbound/unbound.conf.d/pi-hole.conf
COPY unbound-run /etc/services.d/unbound/run
RUN chmod 0755 /etc/services.d/unbound/run

ENTRYPOINT ./s6-init

