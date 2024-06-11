#!/bin/bash

set -e # shell script will validate each and every command and don't show the error where it has occured
#if there is an error occured while executing the script,the below method is used to identify the error while using set -e command
failure(){
    echo "Failed at $1 : $2"
}

trap 'failure ${LINENO} "BASH_COMMAND"' ERR
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "can't able to install MYSQL, only root user can have permission to install it"
    exit 1 # manually exit if error occurs

else
    echo "you are a super user"

fi
dnf install mysql -y



dnf install git -y



echo "is script is proceeding