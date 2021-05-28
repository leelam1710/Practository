#!/bin/bash
#creating instance script
component=$1

if [ -z "${component}" ]; then
  echo "need an input of component name"
  exit 1
fi

aws ec2 run-instances --launch-template LaunchTemplateId=lt-01ce3b1e6b2ed30db --tag-specifications "ResourceType=Instance,Tags=[{key=Name,value=${component}}]"
