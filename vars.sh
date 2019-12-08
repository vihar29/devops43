#!/bin/bash
## declaring a variable 
## syntax ::VAR_NAME=DATA
## no data types in shell scripting by default , means everything is a string
a=10
x=abc
## how to access a variable
## $(VAR_NAME) or $VAR-NAME
echo $a
echo "course name =$course_name"

## use export command to use environmental variables
DATE=2019-12-08
echo -e "hello good evng ,today date is $DATE"
## above statement is true for one day if the date has changed
## if same scripts need to be running daily 
## to get info dynamically execuiting commands.
## command substitution syntax :: VAR_NAME=$(commands)
DATE=$(date +%F)
echo -e "hello good evening,today date is$DATE"
