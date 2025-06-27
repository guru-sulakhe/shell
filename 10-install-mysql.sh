#!/bin/bash

USERID=$(id -u) #this will check whether you are root user or non-root user

if [ $USERID -ne 0 ]
then
    echo "can't able to install MYSQL, only root user can have permission to install it"
    exit 1 # manually exit if error occurs

else
    echo "you are a super user"

fi
dnf install mysql -y

if [ $? -ne 0 ] # $? will represents whether the previous used command is successful or not which is known as 'exit status'.
then
    echo "Installation of MYSQL.. is failed"
    exit 1
else
    echo "Installation of MYSQL.. is successful"
fi

dnf install git -y

if [ $? -ne 0 ] 
then
    echo "Installation of GIT.. is failed"
    exit 1
else
    echo "Installation of GIT.. is successful"
fi

echo "is script is proceeding"