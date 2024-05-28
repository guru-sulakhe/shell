#!/bin/bash

echo "All Variables: $@"
echo "Number of variables passed : $#"
echo "Script  Name : $0"
echo "Current working directory : $PWD"
echo "Home directory of the current user : $HOME"
echo "Which user is running the current script: $USER" 
echo "HostName : $HOSTNAME"
echo "Proceed ID of the current shell script : $$"
sleep 30 & # which will run in the background with 30 seconcds in order to know about the process instance id of this command ,type as ps -ef
echo "Procees ID of the last background command: $!"