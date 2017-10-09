#!/bin/bash

check()
{
  ## check whether already
  content=\'/$1/p\'
  tmpline=$(sed -n $content /etc/profile)
  if [ "$tmpline" != '' ]
  then
    echo "Pattern \"$1\" already exists, please recheck /etc/profile!"
    echo 'Nothing edited.'
    exit -2
  fi
}

turnON()
{
  # no need to check!

  ## edit /etc/profile
  tmpline=$(grep 'ulimit' /etc/profile)
  if [ "$tmpline" == '' ]; then
    sed -i '$ a ulimit -c unlimited' /etc/profile
  else
    sed -i '/ulimit/c ulimit -c unlimited' /etc/profile
  fi
  ## take effect
  source /etc/profile

  # need more details and explanation here!
  #sh /etc/setCoredump.sh

  echo "Turned on!"
}

turnOFF()
{
  # no need to check!
  #check "ulimit -S -c 0"

  ## edit /etc/profile
  tmpline=$(grep 'ulimit' /etc/profile)
  if [ "$tmpline" == '' ]; then
    sed -i '$ a ulimit -S -c 0 > /dev/null 2>&1' /etc/profile
  else
    sed -i '/ulimit -c/c ulimit -S -c 0 > /dev/null 2>&1' \
      /etc/profile
  fi
  ## take effect
  source /etc/profile
  echo "core" > /proc/sys/kernel/core_pattern
  echo 0 > /proc/sys/kernel/core_uses_pid
  echo "Turned off!"
}

usage()
{
  echo "usage: source thisfile [on|off] "
  echo "if not sourced the switch of core dump would not take effect!"
  echo "To control switch of coredump. ONLY suitable for IAEs(BW, TX1) now!"
}

##### MAIN
if [ $# -lt 1 ]
then
  usage
else
  case "$1" in
    on)   turnON;;
    off)  turnOFF;;
    *)    usage;;
  esac
fi

