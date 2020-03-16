# LTS version of Ubuntu supported by Pufferpanel
FROM   ubuntu:18.04

# Author
MAINTAINER jorisvos <jorisvos037@gmail.com>

# Set environment variables
ENV    DEBIAN_FRONTEND noninteractive

ENV    VIRTUAL_HOST localhost
ENV    VIRTUAL_PORT 8080

ENV    ADMIN_NAME root
ENV    ADMIN_PW pufferpanel
ENV    ADMIN_EMAIL root@localhost

# Download and install neccessarry software.
RUN    apt-get --yes update
RUN    apt-get --yes upgrade
RUN    apt-get --yes install software-properties-common

RUN    apt-add-repository universe
RUN    apt-get --yes update

RUN    apt-get --yes install expect ssh \ 
       openssl curl nginx mysql-client mysql-server php-fpm php-cli php-curl php-mysql

# Download and unpack PufferPannel
RUN    mkdir -p /srv && cd /srv && \
       curl -L -o pufferpanel.tar.gz https://git.io/fNZYg && \
       tar -xf pufferpanel.tar.gz && \
       cd pufferpanel  && \
       chmod +x pufferpanel

# Add all needed scripts to container
ADD    ./scripts/start /start
ADD    ./scripts/install.exp /srv/install
ADD    ./scripts/fixconfig /srv/fixconfig
ADD    ./scripts/fixnginx /srv/fixnginx

# Fix execution permissions for added scripts
RUN    chmod +x /start
RUN    chmod +x /srv/install
RUN    chmod +x /srv/fixconfig
RUN    chmod +x /srv/fixnginx

# Configure Nginx (remove default config since we don't need this)
RUN    rm /etc/nginx/sites-enabled/default

# 5657 for SFTP
EXPOSE 5657

# 5656 for Daemon
EXPOSE 5656

# 8080 for WebServer
EXPOSE 8080

# 25565 is the standard port for a minecraft server
EXPOSE 25565

# /start is the start script
CMD    ["/start"]
