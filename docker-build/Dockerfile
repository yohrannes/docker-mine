# Use a imagem oficial do CentOS 7 como base
FROM balenalib/aarch64-ubuntu
WORKDIR /root

#Preparing system for minecraft server, installing tmux for run server in detached, and nano for script edition facility
RUN apt update -y
RUN apt upgrade -y
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nano -y
RUN mkdir minecraft-server
RUN mkdir server-volume
RUN mkdir backupsmine
RUN apt-get install rsync -y

VOLUME ["/root/server-volume"]

WORKDIR /root/minecraft-server

#COPY . .

# Download and install java from oficial website, and install server.jar from official minecraft website # Set permissions... # Preparing minecraft server folders
RUN apt install wget -y
RUN apt-get install openjdk-21-jdk -y
RUN wget https://piston-data.mojang.com/v1/objects/79493072f65e17243fd36a699c9a96b4381feb91/server.jar
RUN apt install tmux -y; chmod +x ./*
RUN java -Xmx1024M -Xms1024M -jar server.jar --nogui --prepare

#COPY ./eula.txt .

EXPOSE 25565

# Starting  minecraft server....
CMD ["/root/server-volume/start.sh"]

#docker run -d -p 25565:25565 -v /home/ubuntu/repos-git/docker-mine/server-volume:/root/server-volume 788535b93023

#docker run -it --rm -p 25565:25565 -v /home/ubuntu/repos-git/docker-mine/server-volume:/root/server-volume ada16fca6f73 bash
