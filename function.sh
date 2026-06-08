#!/bin/bash
great() {

	read -p "enter your name : " name
	echo "hello, $name"
}

add() {
	read -p "Enter the first number.." num1
	read -p "Enter the second number.." num2
	echo "adding $num1 and $num2"
	sum=$((num1+num2))
	echo $sum

}

great

add

