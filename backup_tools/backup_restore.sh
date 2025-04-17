echo "Pick an option: "
echo "1) Backup Files"
echo "2) Restore Files"
read option
#asks user to pick an option

if [[ $option -eq 1 ]]
then
#option one chosen
echo "please chose a directory to backup"
read directory
#if input is empty or directory is empty, display error and try again
while [[ -z $directory || ! -d $directory ]]
do
echo "input is empty or directory does not exist, please try again"
read directory
done
if [ ! -d backups ]
then
#if directory named backups does not exist then make one
mkdir backups
fi
#compresses chosen directory and name it based of date and time
tar -czf ~/backups/"$(date '+%Y-%m-%d_%H-%M-%S').tar.gz" "$directory" 
elif [[ $option -eq 2 ]]
then
#option 2 chosen
cd backups
ls
echo "Enter the backup file to restore, do not include extention"
read backup
#if input is empty or could not find file display error and try again
while [[ -z "$backup".tar.gz || ! -f "$backup".tar.gz ]]
do
echo "input was either empty or backup file does not exist, try again"
read backup
done
echo "enter directory that you with to extract to"
read extractto
if [[ -z $extractto ]]
then
#extract file in home directory
tar -xvzf "$backup.tar.gz" -C ~/
fi
while [[ ! -d ~/$extractto ]]
do 
#if directory is not found, give error and try again
echo "please re-enter an existing directory"
read extractto
done
if [[ -d ~/$extractto ]]
then
#extract files in chosen directory
tar -xvzf "$backup.tar.gz" -C ~/"$extractto"
fi
fi

