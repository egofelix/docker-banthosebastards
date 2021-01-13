FROM ubuntu:rolling

MAINTAINER EgoFelix <docker@egofelix.de>

RUN apt-get update && apt-get install --no-install-recommends -y \
      apt-transport-https curl gnupg ca-certificates docker.io systemd && \
    apt-key adv --fetch-keys https://packages.egofelix.de/gpg && \
    echo 'deb https://packages.egofelix.de/debian stable main' > /etc/apt/sources.list.d/packages.egofelix.de.list && \
    apt-get update && apt-get install -y \
      banthosebastards && \
    apt-get purge --yes gnupg && apt-get autoremove --yes && \
    apt-get clean && apt-get autoclean && \
    rm -rf \
        /var/log/apt/*.log \
        /var/lib/apt/lists/* && \
    update-alternatives --set iptables /usr/sbin/iptables-legacy && \
    update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy && \
    mkdir -p /etc/banthosebastards/jails

COPY actions.conf main.conf /etc/banthosebastards/

ENTRYPOINT ["/opt/banthosebastards/BanThoseBastards"]
