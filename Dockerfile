# Use a imagem oficial do CentOS 7 como base
FROM centos:centos8.4.2105
WORKDIR /root

#Preparing system for minecraft server, installing tmux for run server in detached, and nano for script edition facility
RUN  sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*; sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*; yum update -y; yum upgrade -y; yum install nano -y; mkdir minecraft-server; mkdir backupsmine

# Download and install java from oficial website, and install server.jar from official minecraft website
RUN yum install wget -y; wget https://download.oracle.com/java/20/latest/jdk-20_linux-x64_bin.rpm; yum install jdk* -y; wget https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar; mv server.jar ./minecraft-server/; yum install tmux -y

# Set permissions...
RUN chmod a+x ./minecraft-server/server.jar

EXPOSE 25565

# Preparing  minecraft server....
RUN java -Djava.net.preferIPv4Stack=true -Xmx1024M -Xms1024M -jar ./minecraft-server/server.jar --nogui --prepare

COPY . /root/minecraft-server

# Starting  minecraft server....
#CMD ["java", "-Djava.net.preferIPv4Stack=true", "-Xmx1024M", "-Xms1024M", "-jar", "./minecraft-server/server.jar", "nogui"]
