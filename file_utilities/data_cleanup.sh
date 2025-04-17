#!/bin/bash
# Prompts the user to enter the name of a directory containing text files
echo "Enter the name of a directory that contains text files:"
read chosendir

# if input is empty or directory is empty, display error and try again
while [[ -z $chosendir || ! -d $chosendir ]]
do
echo "input is empty or directory does not exist, please try again"
read chosendir
done

# if directory cleaned_data does not exist, then make it
if [ ! -d cleaned_data ]
then 
mkdir cleaned_data
fi

# go into chosen directory and remove all blank lines in text files
cd $chosendir
sed -i '/^$/d' *.txt

# go through text files and convert to lowercase and remove duplicate lines
for file in *.txt; do
if [[ -f "$file" ]]; then
tr '[:upper:]' '[:lower:]' < "$file" > temp_file && mv temp_file "$file"
sort -u < "$file" > temp_file && mv temp_file ~/cleaned_data/"$file"
fi
done

# go into cleaned_data directory and log the names of all text files into cleanup_log.txt
cd ~/cleaned_data
ls *.txt > ~/cleanup_log.txt

