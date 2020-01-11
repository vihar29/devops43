#!/bin/bash
##case $var in
#pattern1)
#cmd
#cmd
#;;
#pattern2)
#cmd
#cmd
#;;
#esac
Action=$1
case $Action in
start)
echo "starting service"
exit 0
;;
stop)
echo "stopping service"
exit 0
;;
*)
echo "invalid input"
exit 1
;;
esac
