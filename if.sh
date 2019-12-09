#!/bin/bash
## if usuallly seem in three forms
## simple if
# if [expression];then

#commands
#fi
## commands will be executed if expression is true

## if else
# if [expression];then
#commandsA
#else
#commandb
#fi
## commandsA will be executed if expression is true, else if expression is false then commandsB will be executed
## expressions
#1. string checks
#["abc"="ABC"]
#operators : =,==,!=,-z.
# 2.number checks
#operators : -eq, -ne, -gt ,-lt ,-le ,-ge
#3. file checks
# refer , man bash to get all the file related operations
ACTION=$1
if [ "$ACTION" == "start" ]; then 
echo "starting service"
exit 0
elif [ "$ACTION" == "stop" ];then 
echo "stopping service"
exit 0
else 
  echo "Invalid Input"
  exit 1
fi




