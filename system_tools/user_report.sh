cat /etc/passwd | awk -F: '{print $1, " ", $6}' > user_report.txt
#gets user and directory and outputs it to user_report
#counts lines to get total number of users
echo "Total number of users: "
#cat /etc/passwd | wc -l
last | wc -l
#prints out the date of last login for each user and outputs to txt file
last | awk '{print $4, $5, $6, $7}' >> user_report.txt
#Displays the number of users who have logged in within the last 30 days 
echo "Number of users who have logged in within the last 30 days: "
lastlog -b 0 -t 30 | wc -l
