#! bin/bash
yum install nginx -y
if [ "$?" == "eq0"];then
echo "nginx installation success"
elif 
echo "nginx installation failure"