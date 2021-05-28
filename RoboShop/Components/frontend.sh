#!/bin/bash

COMPONENT=frontend

source Components/Common.sh

Print "Installing Nginx" "yum install nginx"
yum install nginx -y
Stat $?

Print "Downloading frontend content" 'curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"'
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
Stat $?

Print "Removing Old Docs" "cd /usr/share/nginx/html && rm -rf *"
cd /usr/share/nginx/html && rm -rf *
Stat $?

Print "Extracting frontend zip" "unzip /tmp/frontend.zip"
unzip /tmp/frontend.zip && mv frontend-main/* . && mv static/* . && rm -rf frontend-master README.md
Stat $?

Print "Setting up roboshop.conf" "localhost.conf /etc/nginx/default.d/roboshop.conf"
mv localhost.conf /etc/nginx/default.d/roboshop.conf
Stat $?

Print "Starting Nginx Service" "systemctl start nginx"
systemctl enable nginx
systemctl start nginx
Stat $?