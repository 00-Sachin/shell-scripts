#!/bin/bash

read -p "enter the name of the package you want to install" packagename

sudo apt-get install $packagename

echo "pacakge is installed successfully"

systemctl status $packagename


