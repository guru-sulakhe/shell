#!/bin/bash

USERID=$(id -u) #script execute and store the output in USERID

if [ USERID -ne 0 ]
then
    echo "Only super user have access to install the packages"
    exit 1
else
    echo "You are a super user"
fi

for i in $@ # $@ represents all variables, it is important to give packages name whenever running the script
do
    echo "packages to install : $i"  # Here $i represents variable names given by user to install,for each iteration it will take one package to install
done