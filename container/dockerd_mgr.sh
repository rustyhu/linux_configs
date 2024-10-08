#!/bin/bash

# Refer to
# https://dev.solita.fi/2021/12/21/docker-on-wsl2-without-docker-desktop.html#:~:text=So%2C%20how%20to%20run%20Docker%20on%20WSL2%20under,the%20following.%20Install%20pre-required%20packages%20sudo%20apt%20update

function start {
  DIR=/home/huruhai/.docker
  nohup sudo -b dockerd < /dev/null > $DIR/dockerd.log 2>&1
  echo "[mgr]: Started."
}

function stop {
  # Handle the target name carefully or this line would kill other processes you do not expect
  sudo pkill -x -f 'dockerd'
}

function help {
  echo "Usage:
  -b/no args  Start docker mgr (default)
  -e          Stop
  -r          Restart
"
}

if [[ $# -eq 0 || "$1" == "-b" ]]; then
  # default do start dockerd
  start
elif [[ "$1" == "-e" ]]; then
  stop
elif [[ "$1" == "-r" ]]; then
  stop
  sleep 1 # need to pause
  start
elif [[ "$1" == "-h" ]]; then
  help
else
  echo "Invalid flag."
fi

