#!/bin/sh

screen -S mc-server -X stuff 'stop\n'
screen -r mc-server
