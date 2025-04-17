echo "enter the name of a CSV file, do NOT include extension"
read csvfile
#prompts user to enter name of CSV file
#checks input to make sure it is not empty or incorrect
while [[ -z "$csvfile".csv || ! -f "$csvfile".csv ]]
do
echo "input was either empty or file was not found, please re-enter"
read csvfile
done
#calculates the number of lines in the file
awk 'END{print NR}' "$csvfile".csv
#prompts user to pick a column
echo "What column do you want to calculate?"
read column
#displays the sum and average to the screen
awk -F',' '{sum+=$column;}END{print sum;}' "$csvfile".csv
awk -F',' '{sum+=$column;}END{print sum / NR;}' "$csvfile".csv
#saves the output to a txt file named data_report
awk -F',' '{sum+=$column;}END{print sum;}' "$csvfile".csv > data_report.txt
awk -F',' '{sum+=$column;}END{print sum / NR;}' "$csvfile".csv >> data_report.txt

