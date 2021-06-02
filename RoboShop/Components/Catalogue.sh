#!/bin/bash

COMPONENT=catalogue

source Components/Common.sh

Print "Installing NodeJS" "yum install nodejs make gcc-c++ -y"
yum install nodejs make gcc-c++ -y
Stat $?

Print "Adding Roboshop Project user" "useradd roboshop"
id roboshop || useradd roboshop
Stat $?

Print "Downloading Catalogue Component Code" "curl -s -L -o /home/catalogue.zip https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
curl -s -L -o /home/catalogue.zip https://github.com/roboshop-devops-project/catalogue/archive/main.zip
Stat $?

Print "Extracting Catalogue Component Code" "rm -rf /home/roboshop/catalogue && cd /home/roboshop && unzip /tmp/catalogue.zip && mv catalogue-main catalogue"
rm -rf /home/roboshop/catalogue && cd /home/roboshop && unzip /home/catalogue.zip && mv catalogue-main catalogue
Stat $?

Print "Install NodeJS dependencies" "npm install"
npm install --unsafe-perm
Stat $?

chown roboshop:roboshop /home/roboshop -R

Print "Update SystemD Script for Catalogue" "sed -i -e 's/MONGO_DNSNAME/mongodb-ss.devopsb54.tk/' /home/roboshop/catalogue/systemd.service && mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service"
sed -i -e 's/MONGO_DNSNAME/mongodb-ss.devopsb54.tk/' /home/roboshop/catalogue/systemd.service && mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
Stat $?

Print "Start Catalogue Service" "systemctl daemon-reload && systemctl restart catalogue && systemctl enable catalogue"
systemctl daemon-reload && systemctl restart catalogue && systemctl enable catalogue
Stat $?