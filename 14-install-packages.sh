#!/bin/bash

USERID=$(id -u) #script execute and store the output in USERID
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
R="\e[31m" #for red color
G="\e[32m" #for green color
Y="\e[33m" #for yellow color
N="\e[0m" #for normal color

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2.. FAILED"
    else
        echo "$2.. SUCCESSFUL" 
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Only super user have access to install the packages"
    exit 1
else
    echo "You are a super user"
fi

for i in $@ # $@ represents all variables, it is important to give packages name whenever running the script
do
    echo "packages to install : $i"  # Here $i represents variable names given by user to install,for each iteration it will take one package to install
    dnf list installed $i &>>$LOGFILE
    if [ $? -eq 0 ]
    then
        echo "already installed $i package,$Y skipping.. $N"
    else
        echo "$i is not installed, Need to install"
    fi
done