FROM dockerfile/ubuntu

#install redis
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install redis-server -y

# Create a mountable volume
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Expose ports
EXPOSE 6379

# Define default command.
CMD ["redis-server"]

# Install Node.js
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install nodejs-legacy -y
RUN apt-get install npm -y
RUN cd /opt && git clone https://github.com/NodeBB/NodeBB.git nodebb
RUN cd /opt/nodebb && npm install
RUN apt-get install imagemagick -y

VOLUME /opt/nodebb

# Define working directory.
WORKDIR /opt/nodebb

EXPOSE 4567

# Define default command.
CMD ["node", "app.js"]
