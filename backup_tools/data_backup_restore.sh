#!/bin/bash
# Prompts user to pick an option
echo "Choose an option:"
echo "1. Backup a specified directory"
echo "2. Restore data from a backup"
read userinput

# Checks if user input was a 1 or 2
while [[ $userinput != 1 && $userinput != 2 ]]
do
echo "please enter either 1 or 2"
read userinput
done 

# Checks if backup_log.txt exist, if it doesn't it is created
if [[ ! -f backup_log.txt ]]
then
touch backup_log.txt
fi

# If user inputs 1 - Backup a specified directory
if [[ $userinput -eq 1 ]]
then
# Prompts user to specify a directory
echo "Specify a directory to back up"
read userdir

# If input is empty or directory doesn't exist, user is prompted to try again
while [[ -z $userdir || ! -d $userdir ]]
do
echo "input is either empty or directory doesn't exist, try again"
read userdir
done

# if directory exists, then it is compressed and saved with a timestamped filename
timestamp=$(date '+%Y-%m-%d_%H-%M-%S')
tar -czf ~/"$timestamp.tar.gz" "$userdir"

# If the file now exists, then backup was successful
if [[ -f "$timestamp.tar.gz" ]]
then
echo "Successful backup"
# Logs the backup operation in backup_log.txt
echo "$timestamp - Backup of $userdir directory completed. Backup file: $timestamp.tar.gz. Status: Success" >> backup_log.txt
fi

# If user picked 2 - Restore data from a backup
elif [[ $userinput -eq 2 ]]
then
# Lists all backups
echo "Here is a list of all backups"
ls *.tar.gz
# User is prompted for which backup they wasnt to restore
echo "Enter which backup you wish to restore (do not include extension)"
read backupselect

# If input is empty or backup does not exist, then user is prompted to try again
while [[ -z "$backupselect" || ! -f "$backupselect.tar.gz" ]]
do
echo "input was empty or invalid, please try again"
read backupselect
done

# User is prompted to specify location/directory to put restored backup
echo "enter the directory you wish to extract the backup to, hit return for home directory"
read extractto

# If directory does not exist then it prompts user to try again
while [[ ! -d ~/$extractto ]]
do
echo "please re-enter an existing directory, or hit return for home directory"
read extractto
done

# If user leaves empty, then backup goes in home directory
if [[ -z extractto ]]
then
tar -xvzf "$backupselect.tar.gz" -C ~/
fi
# If user selects existing directory, then restored backup goes there
if [[ -d ~/$extractto ]]
then
tar -xvzf "$backupselect.tar.gz" -C ~/"$extractto"
fi
fi
