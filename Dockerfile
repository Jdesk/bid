FROM       ubuntu:latest
MAINTAINER james barlow <james@jurisdesk.com>
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org$
RUN apt-get update && apt-get install -y mongodb-org=3.0.1 mongodb-org-server=3.0$
RUN mkdir -p /data/db
EXPOSE 27017

# Set usr/bin/mongod as the dockerized entry-point application
ENTRYPOINT ["/usr/bin/mongod"]

ADD node:5.0.0-onbuild 

ENV NODE_ENV=production \ 
daemon=false \ 
silent=false 
CMD node app --setup && npm start EXPOSE 4567

