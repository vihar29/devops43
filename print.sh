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
## colours are two types backgnd and foregnf 
#syntax :: echo -e "FCOLmMESSAGE" fgnd
##syntax :: echo -e "BCOLmmessage" bgnd
## syntax :: echo -e "\e[BCOL;FCOLmMESSAGE"
### Color Codes 
#  Color          # F Col           # B Col 
# Red               31                41        
# Green             32                42
# Yellow            33                43
# Blue              34                44
# Magenta           35                45
# Cyan              36                46

echo -e "\e[31mhello world with harsha fg colour"
echo -e "/e[46m justice denied is justice denial"


