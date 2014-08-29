# sudo docker build -t="sitano/memcached:latest" .
# sudo docker tag <image> sitano/memcached:1.4.20

FROM ubuntu:trusty
MAINTAINER Ivan Prisyazhniy <john.koepi@gmail.com>

# Install packages
RUN DEBIAN_FRONTEND=noninteractive \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C71C1F19 && \
  echo 'deb http://ppa.launchpad.net/john-koepi/common/ubuntu trusty main' > /etc/apt/sources.list.d/johnkoepi.list && \
  apt-get update && \
  apt-get -y install memcached

# memcached public variable
ENV MAX_MEM 64
ENV BIND 0.0.0.0
ENV MAX_CONN 1024

EXPOSE 11211

CMD /usr/bin/memcached -u root -v -m $MAX_MEM -l $BIND -c $MAX_CONN
