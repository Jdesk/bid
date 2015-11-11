FROM node:5.0.0-onbuild 
RUN apt-get install -y redis-server

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["redis-server", "/etc/redis/redis.conf"]

# Expose ports.
EXPOSE 6379
ENV NODE_ENV=production \ 
daemon=false \ 
silent=false 
CMD node app --setup && npm start EXPOSE 4567

