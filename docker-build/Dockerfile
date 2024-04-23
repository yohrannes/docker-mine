# Use a imagem oficial do CentOS 7 como base
FROM arm64v8/centos:7
WORKDIR /root

#Preparing system for minecraft server, installing tmux for run server in detached, and nano for script edition facility
RUN sed --in-place=.orig --regexp-extended 's%#baseurl=http://mirror.centos.org/centos/%baseurl=https://mirrors.edge.kernel.org/centos/%g' /etc/yum.repos.d/CentOS-*.repo && \
    sed --in-place --regexp-extended 's%^mirrorlist=%#mirrorlist=%g' /etc/yum.repos.d/CentOS-*.repo && \
    yum clean expire-cache
#RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*;
#RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*;
RUN yum update -y;
RUN yum upgrade -y;
RUN yum install nano -y;
RUN mkdir minecraft-server;
RUN mkdir backupsmine;
RUN yum install rsync -y

WORKDIR /root/minecraft-server

COPY . .

# Download and install java from oficial website, and install server.jar from official minecraft website # Set permissions... # Preparing minecraft server foles
RUN yum install wget -y; wget https://download.oracle.com/java/20/latest/jdk-20_linux-x64_bin.rpm; yum install jdk* -y; wget https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar; yum install tmux -y; chmod a+x ./*; java -Xmx1024M -Xms1024M -jar server.jar --nogui --prepare

COPY ./eula.txt .

EXPOSE 25565

# Starting  minecraft server....
# CMD ["./minecraft-server/start.sh"]
