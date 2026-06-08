#!/bin/bash

read -p "enter a number" num

if [[ $num -eq 0 ]]
then 
	echo "Its a zero number"
elif [[ $num -gt 0 ]]
then
	echo "Its a positive number"
else
	echo "Its a negative number"
fi


