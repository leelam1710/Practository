#!/bin/bash

USER_ID=$(id -u)
if [ "$USER_ID" -ne 0 ]; then
  echo "you must be a root user to run this script"
  exit 1
fi

# Linux OS Based
#Print() {
#  echo -e "\e[1m $(date +%c) \e[35m$(hostname)\e[0m \e[1;36m${COMPONENT}\e[0m :: $1"
#}

Print() {
  echo -e "[\e[1;34mINFO\e[0m]----------< \e[1m $1 \e[0m>-----------------"
  echo -e "[\e[1;34mINFO\e[0m]\e[1m $2 \e[0m"
  echo -e "[\e[1;34mINFO\e[0m]-------------------------------------------------------------\n"

}

Stat() {
  echo -e "\n[\e[1;34mINFO\e[0m]-------------------------------------------------------------"
  if [ "$1" -eq 0  ]; then
    echo -e "[\e[1;34mINFO\e[0m] \e[1;32mSUCCESS \e[0m"
  else
    echo -e "[\e[1;34mINFO\e[0m] \e[1;31m EXIT STATUS - $1 :: FAILURE \e[0m"
    exit 2
  fi
echo -e "[\e[1;34mINFO\e[0m]-------------------------------------------------------------\n"

}