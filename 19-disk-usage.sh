#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs) #storing xfs disk memory
DISK_THRESHOLD=50
MESSAGE=""

while IFS= read -r line #for reading each line
do 
    USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1) #storing percentage of disk memory usage
    FOLDER=$(echo $line | grep xfs | awk -F " " '{print $NF}') #storing folder name of disk memory usage
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then 
        MESSAGE="$FOLDER is more than $DISK_THRESHOLD with a memory usage of $USAGE \n"
    fi
done <<< $DISK_USAGE #giving xfs disk memory as disk memory input

echo -e "Message: $MESSAGE"