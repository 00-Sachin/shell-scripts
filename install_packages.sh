#!/bin/bash
set -e 
# Check if the user is running as root
if [ "$EUID" -ne 0 ]; then
  echo "Error: This script must be run as root (or with sudo)."
  exit 1
fi
# displaying  the name of packages 

echo "The list of packegs include nginx, curl, wget"
for i in nginx curl wget
do
	echo "checking the status of $i"
	if  dpkg -s $i &> /dev/null 
	then
		echo "$i is allready installed"
	else
		echo "Updating system files"
		sudo apt-get update -y &> /dev/null
		echo "Installing $i .."
		sudo apt install -y $i &> /dev/null
	  if dpkg -s $i &> /dev/null 
	  then 
		  echo "Result Success"
	  else
		  echo"failed"
	  fi
	fi
done

