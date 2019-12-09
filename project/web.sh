#!/bin/bash
# global variables
LOG=/tmp/stack.log






#web server installation
yum install nginx -y &>>$LOG
if [ $? -eq 0 ];then
echo "nginx installation success"
else 
echo "nginx installation failure"
exit 1
fi
