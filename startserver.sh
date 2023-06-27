#!/bin/sh

screen -S mc-server -Q select .
if [ $? -eq 0 ]; then
  echo "Server already running on screen session!"
  exit 1
fi

SAVEINTERVAL=600

while getopts 's:d:w:' flag; do
  case "$flag" in
    s) SAVEINTERVAL=$OPTARG ;;
    d) 
  esac
done

echo "Starting server..."
echo "If this is your first time running you will have to agree to the EULA and run again :)"

screen -dmS mc-server
screen -dmS autosave-mc-server

screen -S mc-server -X stuff 'cd server-files && bash ../server-scripts/startupscript.sh\n'
screen -S autosave-mc-server -X stuff 'cd server-scripts && bash autosaveserverscript.sh -n '$SAVEINTERVAL'\n'

if [ ! -d "server-backups" ]; then
  mkdir "server-backups"
fi
if [ ! -d "server-backups/daily-backups" ]; then
  mkdir "server-backups/daily-backups"
fi
if [ ! -d "server-backups/weekly-backups" ]; then
  mkdir "server-backups/weekly-backups"
fi

screen -dmS backup-daily-mc-server
screen -dmS backup-weekly-mc-server

screen -S backup-daily-mc-server -X stuff 'cd server-scripts && watch -n 86400 bash makedailybackup.sh\n'
screen -S backup-weekly-mc-server -X stuff 'cd server-scripts && watch -n 604800 bash makeweeklybackup.sh\n'

screen -r mc-server
