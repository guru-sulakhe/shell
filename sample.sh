#!/bin/bash
USERID=$(id -u)
DATE=$($date +%F-%H-%M-%S)
SCRIPTNAME=$($0 | cut -d '.' -f1)
LOGFILE=/tmp/$SCRIPTNAME-$DATE.log

R="\e[31m"
G="\e[32m"
y="\e[33m"
R="\e[31m"

VALIDATE(){
    if [ $1 -ne 0 ]
    echo "$2 is failed"
    else
    echo "$2 is success"
    fi
}
if[ $USERID -ne 0 ]
then
    echo "can' install,only super user can only aceess to install"
else
    echo "You are a super user"
fi

for i in $@
do
echo "packages to be installed: $i" 
dnf list installed $i &>>$LOGFILE #This will display the installed packages
if [ $? -eq o ]
then
    echo "$i is already installed, SKIPPING"
else
    echo "Installing $i"
    dnf install $i &>>$LOGFILE
    VALIDATE $? "Installing $i"
