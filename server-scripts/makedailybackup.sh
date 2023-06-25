#!/bin/sh

BACKUPCOUNT=$(ls -1q ../server-backups/daily-backups | wc -l)

if [ $BACKUPCOUNT -ge 1 ]; then
    rm -r ../server-backups/daily-backups/*
fi

cp -r ../server-files/world ../server-backups/daily-backups/world-$(date +"%d-%m-%Y-%R")
