#!/bin/bash

# taking a number input from the user 

read -p "Enter the number from where you want to start the countdown" num

while [ $num -ge 0 ]
do
       	echo "$num"
	((num--))

done 
echo "done"
