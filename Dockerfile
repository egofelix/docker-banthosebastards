FROM debian

MAINTAINER EgoFelix <docker@egofelix.de>

RUN apt-get update && apt-get install --no-install-recommends -y \
      apt-transport-https curl gnupg ca-certificates docker.io systemd && \
    apt-key adv --fetch-keys https://packages.egofelix.de/gpg && \
    echo 'deb https://packages.egofelix.de/debian stable main' > /etc/apt/sources.list.d/packages.egofelix.de.list && \
    apt-get update && apt-get install -y \
      banthosebastards && \
    update-alternatives --set iptables /usr/sbin/iptables-legacy && \
    update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy

ENTRYPOINT ["/opt/banthosebastards/BanThoseBastards"]