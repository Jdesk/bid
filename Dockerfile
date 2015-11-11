FROM node:5.0.0-onbuild 
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install python-software-properties git imagemagick sed supervisor
RUN add-apt-repository -y ppa:rwky/redis
RUN apt-get update && apt-get install -y redis-server

VOLUME ["/data"]

WORKDIR /data

CMD ["redis-server", "/etc/redis/redis.conf"]

# Expose ports.
EXPOSE 6379
ENV NODE_ENV=production \ 
daemon=false \ 
silent=false 
CMD node app --setup && npm start EXPOSE 4567

