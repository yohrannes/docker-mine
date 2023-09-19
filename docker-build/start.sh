#!/bin/bash

echo "eula=true" > eula.txt

java -Xmx1024M -Xms1024M -jar /root/minecraft-server/server.jar nogui