SOURCE_DIRECTORY=/tmp/app-logs

if [ -d $SOURCE_DIRECTORY ]
then
    echo "Source Directory exists"
else
    echo "Source Directory does'nt exists"
fi

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

while IFS=read -r line
do
    echo "Deleting file: $line"
    rm -rf $line
done <<< $FILES

#crontab is a scheduler which, where we can able to schedule a script in the given time
# Lets schedule the above script using crontab
# $ cd /tmp/app-logs
# Here Two logs are created
# $ touch -d 20210101 backend.log
# $ touch -d 20210202 backend.js
# Now we need to delete these logs by using crontab with above script
# $ cd 
# $ cd shell/
# $ crontab -e
# Go to insert mode and insert
# /2 * * * * sh /home/ec2-user/shell/18-delete-old-logs.sh ---> this will delete the logs for every 2 minutes
# $ crontab -l
