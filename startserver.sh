#!/bin/sh

screen -dmS mc-server
screen -dmS autosave-mc-server

screen -dmS backup-daily-mc-server
screen -dmS backup-weekly-mc-server

screen -S mc-server -X stuff 'cd server-files && bash startupscript.sh\n'
screen -S autosave-mc-server -X stuff 'cd server-files && bash autosaveserverscript.sh\n'

screen -S backup-daily-mc-server -X stuff 'cd server-files && watch -n 86400 bash makedailybackup.sh\n'
screen -S backup-weekly-mc-server -X stuff 'cd server-files && watch -n 604800 bash makeweeklybackup.sh\n'

screen -r mc-server
