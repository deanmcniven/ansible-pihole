FROM pihole/pihole:latest

COPY dont-reset-password-on-boot.patch /tmp/dont-reset-password-on-boot.patch
RUN apt update && \
    apt upgrade --yes && \
    apt install -y patch && \
    patch /usr/local/bin/_startup.sh /tmp/dont-reset-password-on-boot.patch && \
    apt remove -y patch && \
    apt autoremove --yes && \
    rm -rf /var/lib/apt/lists/*
