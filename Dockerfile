FROM ubuntu:22.04
WORKDIR /root

#Preparing system for minecraft server, installing tmux for run server in detached, and nano for script edition facility
COPY ./sources.list .
RUN mv ./sources.list /etc/apt/sources.list
RUN apt update -y;
RUN apt upgrade -y;
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nano -y;
RUN mkdir minecraft-server;
RUN mkdir backupsmine;
RUN apt-get install rsync -y

WORKDIR /root/minecraft-server

COPY . .

# Download and install java from oficial website, and install server.jar from official minecraft website # Set permissions... 

# Preparing minecraft server files

RUN apt-get install wget -y
RUN apt-get install openjdk-21-jre-headless -y
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Pre-requisites for Buildtools ############# FIND A WAY TO INSTALL THE GIT...
RUN apt install git -y
RUN java -jar plugins/BuildTools.jar



#RUN wget https://piston-data.mojang.com/v1/objects/59353fb40c36d304f2035d51e7d6e6baa98dc05c/server.jar
RUN chmod a+x ./*
RUN chmod a+x ./plugins/*
RUN java -Xmx1024M -Xms1024M -jar *.jar --nogui --prepare

EXPOSE 25565

# Starting  minecraft server....
CMD ["./start.sh"]
