echo "Please enter two numbers"
read num1
read num2
#asks user for input and checks to make sure input is numeric
while [[ ! $num1 =~ ^[0-9]+$ ]] || [[ ! $num2 =~ ^[0-9]+$ ]]
do
echo "Make sure input values are numeric, please enter both numbers again"
read num1
read num2
done

#asks user to chose an operation, loops if incorrect input is given
echo "Please choose an operation:"
read -p "choose if you want to add(+), subtract(-), multiply(*), or divide(/): " opervar

while [[ $opervar =~ ^[a-zA-Z0-9] || -z $opervar ]] 
do
read -p "choose if you want to add(+), subtract(-), multiply(*), or divide(/): " opervar
done

#if statements to add, subtract, multiply, and divide
if [[ $opervar = "+" ]]
then 
echo "addition"
sum=$(($num1 + $num2))
echo "$num1 + $num2 = $sum"
elif [[ $opervar = "-" ]]
then
echo "subtraction"
sub=$(($num1 - $num2))
echo "$num1 - $num2 = $sub"
elif [[ $opervar = "*" ]]
then
echo "multiplication"
mult=$(($num1 * $num2))
echo "$num1 * $num2 = $mult"
elif [[ $opervar = "/" ]]
then
echo "divide"
#checks to make sure denominator is not 0
if [ $num2 -eq 0 ]
then
echo "denominator cannot be zero"
else
div=$(($num1 / $num2))
echo "$num1 / $num2 = $div"
fi 
fi
