echo "Please enter a name of a log file, do NOT inlcude extention."
read logname

#make sure that input is not empty 
while [[ -z "$logname" ]]
do
echo "Please re-enter log file name, NOT including extention"
read logname
done

#checks if file name exists, if not it exits program
if [ ! -f "$logname".log ]
then 
echo "log file does not exist, exiting"
exit 1
else
#Prompts user for keyword to find in file
echo "Please enter keyword"
read keyword
#makes sure that keyword is not empty
while [[ -z "$keyword" ]]
do
echo "Please re-enter keyword"
read keyword
done
#Counts the number of times that keyword appears, displays it to screen
grep -o "$keyword" "$logname".log | wc -l 
#Puts the keyword count in a summary report
grep -o "$keyword" "$logname".log | wc -l > log_summary.txt
#Displays the top 5 most common IP addresses in the log file to the screen
grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' "$logname".log | sort | uniq -c | sort -nr | head -n 5
#Puts the previous IP addresses output in the summary report
grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' "$logname".log | sort | uniq -c | sort -nr | head -n 5 >> log_summary.txt
fi
