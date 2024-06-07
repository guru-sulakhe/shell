#!/bin/bash

USERID=$(id -u) #script execute and store the output in USERID
TIMESTAMP=$(date +%F-%H-%M-%S) #Storing date and time format in TIMESTAMP
SCRIPTNAME=$(echo $0 | cut -d "." -f1) #Storing ScriptName  in SCRIPTNAME
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log #Storing SCRIPTNAME and TIMESTAMP in LOGFILE with .log format
R="\e[31m" #for red color
G="\e[32m" #for green color
N="\e[0m" #for normal color
Y="\e[33m"
echo "Script started executing at : $TIMESTAMP"

VALIDATE(){  #Function Declaration
    if [ $1 -ne 0 ]
    then 
        echo  -e "$2..$R FAILED $N"
    else
        echo "$2..$G SUCCESSFUL $N" 
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
VALIDATE $? "Installing MYSQL.." # Fuction Calling and passing arguements like $? and Installing MYSQL 


dnf install git -y &>>$LOGFILE
VALIDATE $? "Installing GIT.."

echo "is script is proceeding"