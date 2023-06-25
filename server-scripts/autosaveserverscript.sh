#!/bin/sh

SAVEINTERVAL=600

while getopts 'n:' flag; do
    case "$flag" in
        n) SAVEINTERVAL=$OPTARG ;;
    esac
done

watch -n "$SAVEINTERVAL" 'screen -S mc-server -X stuff "say Saving World in 5 Seconds...\n" && sleep 5s && screen -S mc-server -X stuff "save-all\n" && screen -S mc-server -X stuff "say World Saved!\n"'
