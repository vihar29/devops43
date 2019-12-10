#!/bin/bash
# global variables
LOG=/tmp/stack.log
G="\e[32m"
R="\e[31m"
N="\e[0m"




#functions
STATUS_CHECK()
{
    if [ $? -eq 0 ];then
    echo -e "$? --  ${G}SUCCESS${N}"
    else
    echo -e "$? --  ${R}FAILURE${N}"
    exit 1
    fi
}
#functions
HEAD() {
    echo -e "\n\t\e[33m$1\e[0m"
}

#web server installation
HEAD "WEB SERVER SETUP"
yum install nginx -y &>>$LOG
STATUS_CHECK $? "NGINX SERVER INSTALLATION"

rm -rf /usr/share/nginx/html/*  &>>$LOG
STATUS_CHECK $? "REMOVE OLD WEBAPPS CONTENT"

curl -s https://devopsb43n.s3.amazonaws.com/d43.zip -o /tmp/d43.zip 
unzip /tmp/d43.zip -d "/usr/share/nginx/html/"
STATUS_CHECK $? "DOWNLOAD NEW WEBAPPS CONTENT"

## variable declared in function can be accessed and modified inside function
## a variable declared in function main program can be accessed and modified inside function

