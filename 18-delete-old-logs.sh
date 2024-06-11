#!/bin/bash

SOURCE_DIRECTORY=/tmp/app-logs
R="\e[31m" #for red color
G="\e[32m" #for green color
Y="\e[33m"
N="\e[0m" #for normal color
if [ -d $SOURCE_DIRECTORY ]
then
    echo "Source directory exists"
else
    echo -e "Source directory not exists,$R please make sure that $SOURCE_DIRECTORY exists $N"
fi
