# Use a imagem oficial do CentOS 7 como base
FROM centos:centos8
WORKDIR /root
RUN  sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN  sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
RUN yum upgrade -y
RUN yum install java -y
RUN yum install nano -y
RUN mkdir minecraft-server

# Download and install java from oficial website
RUN yum install wget -y
RUN wget https://download.oracle.com/java/20/latest/jdk-20_linux-x64_bin.rpm; yum install jdk-20_linux-x64_bin.rpm -y

# Download and install server.jar from official minecraft website
RUN wget https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar; mv server.jar ./minecraft-server/
RUN echo 'eula=true' > ./minecraft-server/eula.txt
RUN yum install tmux -y

# Starting minecraft server....
# CMD [ "tmux new-window -n mcserver "java -Djava.net.preferIPv4Stack=true -Xmx1024M -Xms1024M -jar server.jar nogui"" ]

EXPOSE 25565

# COPY /path/to/source /destination

