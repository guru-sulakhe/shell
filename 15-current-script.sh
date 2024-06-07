#!/bin/bash

COURSE="Devops from current script"

echo "Before calling other script, course: $COURSE"
echo "Process ID of the current script: $$"

#./16-other-script.sh it is a first way of calling other script
source./16-other-script.sh   #it is second way of calling other script.

echo "After calling other script,course: $COURSE"

#NOTE:
#while calling other script using first way:variable value after calling other script will not change,PID of two scripts are different
#while calling other scrpt using second way:variable value after calling other script will change,PID of two scripts are same
