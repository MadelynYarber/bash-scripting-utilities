echo Please enter your name
read namevar
#asks user to enter name and makes sure input is not empty
while [[ -z "$namevar" ]]
do
echo "Empty input, please try to enter your name again"
read namevar
done

#Asks user for age and makes sure it was a number greater than 0 entered
echo Please enter your age
read agevar

while [[ ! $agevar =~ ^[0-9]+$ ]] || [[ $agevar -le 0 ]]
do
echo "Error, please re-enter your age"
read agevar
done

#displays name and age
echo Hello $namevar age $agevar

#conditional statement, ages 18 and up are eligible to vote
if [ $agevar -ge 18 ]
then
echo "You are eligible to vote"
else
echo "You are not eligible to vote"
fi
