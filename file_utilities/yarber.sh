#!/bin/bash

# Assignment 4: Basic Bash Scripting
# October 19, 2024
# COP4342-0002
# Term: Fall 2024
# Madelyn Yarber
# Description: This is a single bash shell script that accepts two parameters. Both parameters are files. 
# The output file will contain the words that are in road.txt with the duplicates removed and sorted aphabetically 

# checks to make sure there are 2 parameters, displays message and exits if not
if [ "$#" -ne 2 ]; then
	echo "You need to have two parameters"
	exit 1
fi

# checks to make sure first parameter exists, road.txt is our example
# displays message and exits if the first file paramete does not exist
if [ ! -f $1 ]; then
	echo "The first file parameter does not exist"
	exit 1
fi

# checks if the second parameter file does not exist, if it doesn't it is created
if [ ! -f $2 ]; then 
	touch $2
	echo "Output file named $2 has been created"
fi 

# goes through the words in first file and checks for duplicates
# outputs to the second file with the words sorted alphabetically and no duplicates
# if second file already exists, it will be overwritten
grep -o -E '\w+' $1 | sort -u -f > $2

# exits program
exit 0
