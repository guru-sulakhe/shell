#!/bin/bash

SOURCE_DIRECTORY=/tmp/app-logs #deciding this folder to delete old logs
R="\e[31m" #for red color
G="\e[32m" #for green color
Y="\e[33m"
N="\e[0m" #for normal color
if [ -d $SOURCE_DIRECTORY ] #checking SOURCE_DIRECTORY is existed or not
then
    echo -e "$G Source directory exists $N"
else
    echo -e "Source directory not exists,$R please make sure that $SOURCE_DIRECTORY exists $N"
    exit 1
fi

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14) #finds the .log files with more than 14 days in SOURCE_DIRECTORY

while IFS= read -r line #reads each line in $FILE
do
    echo "Deleting file: $line"
    rm -rf $line  #deleting .log file 
done <<< $FILES #$FILE is input