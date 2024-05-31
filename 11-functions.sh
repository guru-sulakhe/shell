#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
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
    echo "can't able to install MYSQL, only root user can have permission to install it"
    exit 1 # manually exit if error occurs

else
    echo "you are a super user"

fi
dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing MYSQL.."


dnf install git -y &>>$LOGFILE
VALIDATE $? "Installing GIT.."

echo "is script is proceeding"