#!/bin/bash

USERID=$(id -u)
VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2.. FAILED"
    else
        echo "$2.. SUCCESSFUL" 
}

if [ $USERID -ne 0 ]
then
    echo "can't able to install MYSQL, only root user can have permission to install it"
    exit 1 # manually exit if error occurs

else
    echo "you are a super user"

fi
dnf install mysql -y
VALIDATE $? "Installing MYSQL.."


dnf install git -y
VALIDATE $? "Installing GIT.."

echo "is script is proceeding"