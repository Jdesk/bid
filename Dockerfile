FROM ubuntu:14.04

MAINTAINER James Barlow <james@jurisdesk.com>

# Install Redis
RUN   \
  apt-get -y -qq install python redis-server

# Install Node
RUN   \
  cd /opt && \
  wget http://nodejs.org/dist/v4.2.2/node-v4.2.2-linux-x64.tar.gz && \
  tar -xzf node-v4.2.2-linux-x64.tar.gz && \
  mv node-v4.2.2-linux-x64 node && \
  cd /usr/local/bin && \
  ln -s /opt/node/bin/* . && \
  rm -f /opt/node-v4.2.2-linux-x64.tar.gz

# Set the working directory
WORKDIR   /src

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 4.2.2

CMD [ "node" ]

ENV NODE_ENV=production \ 
daemon=false \ 
silent=false 
CMD node app --setup && npm start 
EXPOSE 4567
EXPOSE 80
EXPOSE 443

CMD ["/bin/bash"]


