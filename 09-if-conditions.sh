#!/bin/bash

NUMBER=$1 # passing value while running the script

if [ $NUMBER -gt 20 ] 
then
    echo  "Given number $NUMBER is greater than 20"
else
    echo "Given number $NUMBER is less than 20"
fi

# -gt means greater than, -ge means greater than and equal, -lt means less than, -le means less than and equal, -eq means equal to
# -ne means not equal to