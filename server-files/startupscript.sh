#!/bin/sh

JAR=server.jar

# Memory Size in GB
MEMG=6

while [ true ]; do
  java -Xmx"$MEMG"g -Xms"$MEMG"g -jar $JAR nogui
  if [ $? -eq 0 ]; then
    screen -XS backup-weekly-mc-server quit
    screen -XS backup-daily-mc-server quit
    screen -XS autosave-mc-server quit
    screen -XS mc-server quit
    break
  fi
done
