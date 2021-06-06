#!/bin/bash

COMPONENT=payment

source Components/Common.sh

Print "Install Python3" "yum install python36 gcc python3-devel -y"
yum install python36 gcc python3-devel -y
Stat $?

Print "Create RoboShop User" "id roboshop || useradd roboshop"
id roboshop || useradd roboshop
Stat $?

Print "Download Payment Code" 'curl -L -s -o /tmp/payment.zip "https://github.com/roboshop-devops-project/payment/archive/main.zip"'
curl -L -s -o /tmp/payment.zip https://github.com/roboshop-devops-project/payment/archive/main.zip
Stat $?

Print "Extracting Payment Code" "rm -rf /home/roboshop/payment && cd /home/roboshop && unzip /tmp/payment.zip && mv payment-main payment"
rm -rf /home/roboshop/payment && cd /home/roboshop && unzip /tmp/payment.zip && mv payment-main payment
Stat $?


Print "Install Python Dependencies" "cd /home/roboshop/payment  && pip3 install -r requirements.txt"
cd /home/roboshop/payment  && pip3 install -r requirements.txt
Stat $?

Print "Update User details in Payment script" 'sed -i -e "/^uid/ c uid=${USER_ID}" -e "/^gid/ c gid=${GROUP_ID}" /home/roboshop/payment/payment.ini'
USER_ID=$(id -u roboshop)
GROUP_ID=$(id -g roboshop)
sed -i -e "/^uid/ c uid=${USER_ID}" -e "/^gid/ c gid=${GROUP_ID}" /home/roboshop/payment/payment.ini
Stat $?

chown roboshop:roboshop /home/roboshop -R

Print "Update SystemD Script for Payment" 'sed -i -e "s/CARTHOST/cart-ss.testops.ml/" -e "s/USERHOST/user-ss.testops.ml/" -e "s/AMQPHOST/rabbitmq-ss.testops.ml/" /home/roboshop/payment/systemd.service '
sed -i -e "s/CARTHOST/cart-ss.testops.ml/" -e "s/USERHOST/user-ss.testops.ml/" -e "s/AMQPHOST/rabbitmq-ss.testops.ml/" /home/roboshop/payment/systemd.service
Stat $?

Print "Start Payment Service" "mv /home/roboshop/payment/systemd.service  /etc/systemd/system/payment.service && systemctl daemon-reload && systemctl enable payment && systemctl start payment"
mv /home/roboshop/payment/systemd.service  /etc/systemd/system/payment.service && systemctl daemon-reload && systemctl enable payment && systemctl start payment
Stat $?