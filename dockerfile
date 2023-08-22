# Use a imagem oficial do CentOS 7 como base
FROM centos:9

# (Opcional) Defina o diretório de trabalho padrão dentro do contêiner
WORKDIR /root

# Instalação de todas as ferramentas/programas/dependencias dentro container
RUN sudo yum update
RUN sudo yum upgrade
RUN yum install java
RUN java -version
RUN yum install nano
RUN mkdir minecraft-server
RUN wget https://download.oracle.com/java/20/latest/jdk-20_linux-x64_bin.rpm; sudo yum install jdk-20_linux-x64_bin.rpm
RUN wget https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar; mv server.jar ./minecraft-server/
RUN echo 'eula=true' > ./minecraft-server/eula.txt
RUN sudo yum install tmux
RUN tmux new-window -n mcserver "java -Djava.net.preferIPv4Stack=true -Xmx1024M -Xms1024M -jar server.jar nogui"


# Abra as portas 25565 e 25564
EXPOSE 25565

# (Opcional) Copie os arquivos do sistema que deseja adicionar à imagem
# Por exemplo, se você deseja copiar o conteúdo do diretório "/path/to/source" para "/destination" dentro do contêiner Docker
# COPY /path/to/source /destination

# (Opcional) Execute comandos adicionais, se necessário
# RUN yum install java

# (Opcional) Defina variáveis de ambiente, se necessário
# ENV VARIAVEL=valor

# (Opcional) Execute algum comando quando o contêiner for iniciado
# CMD ["comando", "argumento1", "argumento2", ...]

