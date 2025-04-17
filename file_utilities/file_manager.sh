if [ -d "Backup" ]
then
echo "Backup Exists."
#if Backup does not exist, tells user and makes a directory named Backup
else
echo "Backup does not Exist, making one now"
mkdir Backup
fi

#Copies all .txt files from current directory to Backup directory
cp *.txt Backup

#Counts and displays the files in current directory that just got copied
find . -maxdepth 1 -type f -name "*.txt" | wc -l

#Goes to Backup and lists all .txt files in Backup
cd Backup | ls *.txt

#list of files in Backup is outputted into a file called backup_list.txt
dir /home/class/yarber/Backup > backup_list.txt



