#!/bin/bash
# Asks user which database they wish to connect to
echo "1) Connect to MySQL"
echo "2) Connect to SQLite"

# Checks if user inputted a 1 or 2, asks user to try again if not
while [[ $userdata != 1 && $userdata != 2 ]]
do
echo "Please enter an option of either 1 or 2"
read userdata
done

# If user inputs 1 - Gets MySQL info
if [[ $userdata -eq 1 ]]
then
db_type="mysql"
echo "Enter MySQL username"
read mysqluser
echo "Enter MySQL password"
read mysqlpass
echo "Enter MySQL database name"
read mysqldb
#mysqlconnect="mysql -u $mysqluser -p $mysqlpass $mysqldb"
#mysqlconnect="mysql -u $mysqluser -p $mysqlpass"

# If user inputs 2 - Gets SQLite info
elif [[ $userdata -eq 2 ]]
then
db_type="sqlite"
echo "Enter SQLite database file path: "
read sqlite_db
#sqliteconnect="sqlite3 "$sqlite_db"
fi

# Displays options and prompts user to pick one
echo "Pick an option"
echo "1. Display all records in a specified table"
echo "2. Insert a new record into a specified table"
echo "3. Delete a record based on a specified condition"
read useroption

# Checks user input
while [[ $useroption != 1 && $useroption != 2 && $useroption != 3 ]]
do
echo "Please enter an option 1-3"
read useroption
done

# If user inputs 1 - Display all records in a specified table
if [[ $useroption -eq 1 ]]
then
echo "Display all records in a specified table"
echo "Enter table name"
read tablename
if [[ $db_type == "mysql" ]]
then
mysql -u "$mysqluser" -p"$mysqlpass" -e "SELECT * FROM $tablename;" "$mysqldb"
elif [[ $db_type == "sqlite" ]] 
then
sqlite3 "$sqlite_db" "SELECT * FROM $tablename;"
fi
fi

# If user inputs 2 - Insert a new record into a specified table
if [[ $useroption -eq 2 ]]
then
echo "Insert a new record into a specified table"
echo "Enter table name"
read tablename
echo "Enter the column names, sepetated by commas: "
read column
echo "Enter the values for the columns, seperated by commas: "
read values

if [[ $db_type == "mysql" ]]
then
mysql -u "$mysqluser" -p"$mysqlpass" -e "INSERT INTO $tablename ($column) VALUES ($values);" "$mysqldb"
elif [[ $db_type == "sqlite" ]] 
then
sqlite3 "$sqlite_db" "INSERT INTO $tablename ($column) VALUES ($values);"
fi
fi

# If user inputs 3 - Delete a record based on a specified condition
if [[ $useroption -eq 3 ]]
then
echo "Delete a record based on a specified condition"
echo "Enter table name: "
read tablename
echo "Enter the condition for deletion: "
read condition
if [[ $db_type == "mysql" ]]
then
mysql -u "$mysqluser" -p"$mysqlpass" -e "DELETE FROM $tablename WHERE $condition;" "$mysqldb"
elif [[ $db_type == "sqlite" ]];
then
sqlite3 "$sqlite_db" "DELETE FROM $tablename WHERE $condition;"
fi 
fi
