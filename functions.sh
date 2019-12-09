#!/bin/bash
## if we assign a name to a set of commands then it is a function

## declare a function
## example1 : showing syntax1
function sample(){
    echo "iam a sample function"
}
##example2 :showing syntax2
function sample2 {
    echo "iam a sampke1  function"
}
##
sample
sample2
## function is atype of command
Demo1() {
    echo "first argument =$1"
}
Demo1 "abc"
## function is a command so it should have a exit status
## we cannot use exit command inside function it will exit the entire script
## we use return command to come out of function
## return status also has same status as exit status from 0-255
demo2(){
    echo "windsor is beautiful"
    return 0

    echo "harsha goud"
}
demo2 
echo "exit status of function=$?"

git