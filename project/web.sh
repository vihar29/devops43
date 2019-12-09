#! bin/bash
yum install nginx -y
if [ "$?" == "eq0"];then
echo "nginx installation success"
elif ["$?" =! "eq0"];then
echo "nginx installation failure"
exit 1