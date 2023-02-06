#!/bin/sh

screen -r mc-server
screen -S mc-server -X stuff 'stop\n'