#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "can't able to install MYSQL, only root user can have permission to install it"
    exit 1

else
    echo "you are a super user"

fi
dnf install mysql -y