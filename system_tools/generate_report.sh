#!/bin/bash
# Prompt user to enter the name of a CSV file
echo "please enter name of a CSV file (don't include extension)"
read file

# Checks to make sure input is not empty and that the file exists
while [[ -z $file || ! -f $file.csv ]];
do
echo "input was empty or that csv file does not exist"
read file
done

echo "CSV file: $file" > report.txt

# Gets the number of records in the CSV file and outputs to screen
echo "The number of records in the file is: "
wc -l < $file.csv

# Outputs the number of records in the CSV file to report.txt
echo "The number of records in the file is: " >> report.txt
wc -l < $file.csv >> report.txt


# Prompts the user to specify a column
echo "What column do you want the average, maximum, and minimum values of: "
read column

sum=0
count=0
max=-99999999
min=99999999

# Goes through lines of the CSV file, gets the sum, count, max, and min
while read -r line; 
do
value=$(echo "$line" | awk -v col="$column" '{print $col}')
if [[ "$value" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
sum=$(echo "$sum + $value" | bc)
((count++))
if (( $(echo "$value > $max" | bc -l) ));
then
max=$value
fi
if (( $(echo "$value < $min" | bc -l) ));
then
min=$value
fi
fi
done < $file.csv

# Gets the average value of the numeric column
if [[ $count -gt 0 ]];
then
average=$(echo "scale=2; $sum / $count" | bc)

# Prints out the average, min, and max value
echo "The average value of column $column is: $average"
echo "The minimum value of column $column is: $min"
echo "The maximum value of column $column is: $max"
 
# Copies output to report.txt
echo "The average value of column $column is: $average" >> report.txt
echo "The minimum value of column $column is: $min" >> report.txt
echo "The maximum value of column $column is: $max" >> report.txt

# Gives user option to email the report
echo "Would you like the report.txt to be emailed? y or n"
read userinput

# Makes sure that the user puts in a y or a n
while [[ $userinput != "y" && $userinput != "n" ]]
do
echo "Please enter either a y or n"
read userinput
done

# if user wants to be emailed, user is asked to input their full email
if [ $userinput == "y" ]
then
echo "What is your full email address?"
read useremail

# Asks user to confirm their email
echo "Is this the correct email address: $useremail"
echo "Enter y for yes and n for no"
read input

# If incorrect email, user is able to input until it is correct
while [[ $input == "n" ]]
do
echo "Re-enter your email address"
read useremail
echo "Is this the correct email address: $useremail"
echo "Enter y for yes and n for no"
read input
done

#Setting up email
recipient="$useremail"
subject="Assignment6Report"
body="Report.txt should be attached"
attachment="report.txt"
mail -s "$subject" -a "$attachment" "$recipient" <<< "$body"
echo "report.txt has been emailed to $useremail"

# If user does not want to be emailed, report is saved but not emailed
elif [ $userinput == "n" ]
then
echo "The report has been saved but not emailed"
fi

# If user inputs a invalid column or if there is no valid numbers in column, it exits and user tries again
else
echo "No valid numbers found in this column or invalid column entered"
fi
