#!/bin/sh

BACKUPCOUNT=$(ls -1q ../server-backups/weekly-backups | wc -l)

if [ $BACKUPCOUNT -ge 1 ]; then
    rm -r ../server-backups/weekly-backups/*
fi

cp -r ../server-files/world ../server-backups/weekly-backups/world-$(date +"%d-%m-%Y-%R")
