#!bin /bash
echo line1
echo line2

##syntax is wrong
echo line1/n line2
## to enable escape sequences then you have to -e option
echo -e line1/n line2
## -e enables escape n to be used as a new line
## always use double quotes when we enable escape sequence
echo -e "line1\nline2"



