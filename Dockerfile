FROM ubuntu:latest
MAINTAINER NodeBB Docker Team <docker-devs@nodebb.org>

# Install base packages
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install nodejs nodejs-legacy npm imagemagick git -y

RUN apt-get update
RUN apt-get upgrade -y
RUN add-apt-repository ppa:chris-lea/redis-server
RUN apt-get update && apt-get dist-upgrade

VOLUME ["/data"]
WORKDIR /data

EXPOSE 6379
# Define default command.
CMD ["redis-server"]

# Install nodebb
RUN cd /opt && git clone -b v0.9.x https://github.com/NodeBB/NodeBB nodebb
RUN cd /opt/nodebb && npm install

# Create a mountable volume
VOLUME /opt/nodebb

# Define working directory.
WORKDIR /opt/nodebb

EXPOSE 80
EXPOSE 443
EXPOSE 4567

# Define default command.
CMD ["node", "app.js"]
