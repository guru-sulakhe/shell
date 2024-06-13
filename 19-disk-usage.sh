#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=50
MESSAGE=""

while IFS= read -r line
do 
    USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo $line | grep xfs | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then 
        MESSAGE="$FOLDER is more than $DISK_THRESHOLD with a memory usage of $USAGE \n"
    fi
done <<< $DISK_USAGE

echo -e "Message: $MESSAGE"