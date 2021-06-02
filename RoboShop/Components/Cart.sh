#!/bin/bash

COMPONENT=cart

source Components/Common.sh

Print "Installing NodeJS" "yum install nodejs make gcc-c++ -y"
yum install nodejs make gcc-c++ -y
Stat $?

Print "Adding RoboShop Project User" "useradd roboshop"
id roboshop || useradd roboshop
Stat $?

Print "Download Cart Component Code" 'curl -s -L -o /tmp/cart.zip "https://github.com/roboshop-devops-project/cart/archive/main.zip"'

curl -s -L -o /tmp/cart.zip https://github.com/roboshop-devops-project/cart/archive/main.zip

Stat $?

Print  "Extract Cart Component Code" "rm -rf /home/roboshop/cart && cd /home/roboshop && unzip /tmp/cart.zip && mv /home/roboshop/cart-main /home/roboshop/cart && cd /home/roboshop/cart"
rm -rf /home/roboshop/cart && cd /home/roboshop && unzip /tmp/cart.zip && mv /home/roboshop/cart-main /home/roboshop/cart && cd /home/roboshop/cart
Stat $?

Print "Install NOdeJS Dependencies" "npm install"
npm install --unsafe-perm
Stat $?

chown roboshop:roboshop /home/roboshop -R

Print "Update SystemD Script for cart" "sed -i -e 's/MONGO_DNSNAME/mongodb-ss.devopsb54.tk/' /home/roboshop/cart/systemd.service && mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service"
sed -i -e 's/REDIS_ENDPOINT/redis-ss.testops.ml/' -e 's/CATALOGUE_ENDPOINT/catalogue-ss.testops.ml/' /home/roboshop/cart/systemd.service && mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service
Stat $?

Print "Start cart Service" "systemctl daemon-reload && systemctl restart cart && systemctl enable cart"
systemctl daemon-reload && systemctl restart cart && systemctl enable cart
Stat $?

