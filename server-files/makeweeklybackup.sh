#!/bin/sh

rm -r ../server-backups/weekly-backups/* && cp -r world ../server-backups/weekly-backups/world-$(date +"%d-%m-%Y-%R")
