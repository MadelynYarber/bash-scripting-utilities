echo "Please enter the filename, please include extention"
read fname
#askes user for fname
#makes sure that input is not empty and length is greater than 0
while [[ -z "$fname" || "$fname" -gt 0 ]]
do
echo "Please enter the filename again"
read fname
done

#checks if file name exists, if not it exits program
#if file does exist then it displays number of words and lines in the file
if [ ! -f "$fname" ]
then
echo "file does not exist, exiting"
exit 1
else
echo "file does exist"
echo "number of words in this file: "
wc -w $fname 
echo "number of lines in this file: "
wc -l $fname
fi
