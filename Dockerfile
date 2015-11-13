FROM ubuntu:14.04

MAINTAINER James Barlow <james@jurisdesk.com>

RUN apt-get update
# some node modules (e.g. zmq) need python to install properly
RUN apt-get install -y software-properties-common python
RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
RUN sudo apt-get install -y nodejs
RUN sudo apt-get install -y build-essential
RUN add-apt-repository -y ppa:chris-lea/redis-server
RUN apt-get update && apt-get dist-upgrade
RUN npm cache clear
RUN rm -fr node_modules
WORKDIR /src
ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 4.x
ENV NODE_ENV=production \ 
daemon=false \ 
silent=false 
CMD node app --setup && npm start 
EXPOSE 4567
EXPOSE 80
#EXPOSE 443 -- if using ssl uncomment


