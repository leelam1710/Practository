#!/bin/bash

#creating instance script
component=$1

if [ -z "${component}" ]; then
  echo "need an input of component name"
  exit 1
fi

STATE=$(aws ec2 describe-instances --filters "Name=tag-value,Values=front-end" --query 'Reservations[*].Instances[*].State.Name' --output text)

if [ $STATE != "running" ]; then
  aws ec2 run-instances --launch-template LaunchTemplateId=lt-01ce3b1e6b2ed30db --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${component}}]"
  sleep 15
fi

IPADDRESS=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${component}" --query 'Reservations[*].Instances[*].PrivateIpAddress' --output text)
export component
export IPADDRESS

envsubst <record.json >/tmp/${component}.json

aws route53 change-resource-record-sets --hosted-zone-id Z00339063TJYG8SBV0FZX --change-batch file:///tmp/${component}.json