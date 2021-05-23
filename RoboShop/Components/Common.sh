#!/bin/bash

USER_ID=$(id -u)
if [ "$USER_ID" -ne 0 ]; then
  echo "you must be a root user to run this script"
  exit 1
fi
