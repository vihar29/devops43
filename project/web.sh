#!/bin/bash
# global variables
LOG=/tmp/stack.log
G="\e[32m"
R="\e[31m"
N="\e[0m"
APPUSER=student
TOMCAT_VERSION=8.5.49




#functions
STATUS_CHECK()
{
    if [ $1 -eq 0 ];then
    echo -e "$2 --  ${G}SUCCESS${N}"
    else
    echo -e "$2 --  ${R}FAILURE${N}"
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

sed -i -e '/location \/student/,+3 d' -e '/^        error_page 404/ i \\t location /student { \n\t\tproxy_pass http://localhost:8080/student;\n\t}\n' /etc/nginx/nginx.conf
STATUS_CHECK $? "UPDATE CONFIGURATION FILE"
systemctl enable nginx &>>$LOG
systemctl restart nginx &>>$LOG
STATUS_CHECK $? "STARTING NGINX SERVER"

#app server setup
HEAD "APP SERVER SETUP"
yum install java -y &>>$LOG
STATUS_CHECK $? "JAVA IBSTALLATION SUCCESS"
id $APPUSER &>>$LOG 
if [ $? -ne 0 ]; then 
  useradd $APPUSER 
  STATUS_CHECK $? "Add Application User"
fi 

cd /home/$APPUSER
curl -s https://archive.apache.org/dist/tomcat/tomcat-8/v{TOMCAT_VERSION}/bin/apache-tomcat-{TOMCAT_VERSION}.tar.gz | tar -xz
STATUS_CHECK $? "download tomcat"
cd /home/$APPUSER/apache-tomcat-${TOMCAT_VERSION} 
curl -s https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war -o webapps/student.war
STATUS_CHECK $? "Download StudentApp Application"

cd /home/$APPUSER/apache-tomcat-${TOMCAT_VERSION} 
curl -s https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar -o lib/mysql-connector.jar
STATUS_CHECK $? "Download MySQL JDBC Driver"

sed -i -e '/TestDB/ d' -e '/\/Context/ i <Resource name="jdbc/TestDB" auth="Container" type="javax.sql.DataSource" maxTotal="100" maxIdle="30" maxWaitMillis="10000" username="student" password="student1" driverClassName="com.mysql.jdbc.Driver" url="jdbc:mysql://{DBSERVER-IPADDRESS}:3306/studentapp"/>' conf/context.xml 
STATUS_CHECK $? "Add JDBC Configuration"

chown $APPUSER:$APPUSER /home/$APPUSER -R 

curl -s -o /etc/init.d/tomcat https://s3-us-west-2.amazonaws.com/studentapi-cit/tomcat-init 
chmod +x /etc/init.d/tomcat
STATUS_CHECK $? "Download Tomcat INIT Script"

systemctl daemon-reload &>>$LOG 
STATUS_CHECK $? "Reload Systemd Daemon"

systemctl restart tomcat
STATUS_CHECK $? "Start Tomcat Service"








