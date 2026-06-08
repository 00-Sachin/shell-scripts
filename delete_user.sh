#!/bin/bash

echo "This script is used to delete Grops"

read -p "Enter the Group name you want to delete" groupdel

sudo delgroup $groupdel


