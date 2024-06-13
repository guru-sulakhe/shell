#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=75

while IFS=read -r line
do 
    USAGE=$(df -hT | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(df -hT | grep xfs | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then 
        echo "$FOLDER is more than $DISK_THRESHOLD with a memory usage of $USAGE"

done <<< $DISK_USAGE