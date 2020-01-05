#!/bin/bash


if [ ! -f "$1" ];then
echo "given file does not exist"
exit 1
fi

i=0
STUDENT_COUNT=$(cat batch43.yml | yq . | jq '.studentDetails[].name' | wc -l)
NAMES=('cat batch43.yml | yq . | jq '.studentDetails[].name'|xargs')
TRAINER_NAME=$(cat batch43.yml | yq . | jq '.trainerName')

 
 while [ $STUDENT_COUNT -gt 0 ]; do

 echo -e "hello ${NAMES[$1]},\n\tmy name is $($TRAINER_NAME) "
 STUDENT_COUNT=$(($STUDENT_COUNT-1))
 i=$(($i+1))
 done
