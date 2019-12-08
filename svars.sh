#!/bin/bash
## input should be provided as arguments
## ex: script input1 input2
## by using special variables in shell we can get the arguments parsed into script
## spec vars are 0 to n,@,*,# .
echo $0
echo $1= first arguments
echo $2= second arguments
echo $@
echo $*