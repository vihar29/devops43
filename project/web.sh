#!/bin/bash
# global variables
LOG=/tmp/stack.log


#functions
STATUS_CHECK()
{
    if [ $1 -eq 0 ];then
    echo " $2 --  SUCCESS"
    else
    echo " $2 --  FAILURE"
    exit 1
    fi
}

#web server installation
yum install nginx -y &>>$LOG
STATUS_CHECK $? "NGINX SERVER INSTALLATION"

rm -rf /usr/share/nginx/html/*  &>>$LOG
STATUS_CHECK $? "REMOVE OLD WEBAPPS CONTENT"

#curl -s https://devopsb43n.s3.amazonaws.com/d43.zip -o /tmp/d43.zip 
#unzip /tmp/d43.zip -d "/usr/share/nginx/html/"

## variable declared in function can be accessed and modified inside function
## a variable declared in function main program can be accessed and modified inside function
