#!/bin/bash

os_info() {
	echo "................................................."
	echo "Hostname and OS info"
	echo "................................................."
	
	hostnamectl 
}

uptime_status() {
	echo "--Checking System Uptime Status-----"
	command uptime 
}

disk_usage() {
	echo "-----------------------------"
	echo "Disk Usage (Top 5 Commands)"
	echo "-----------------------------"
	df -h | sort -hr | head -n 5
}

mem_usage() {
	echo "-----------------------------"
        echo "Ram Usage(Top 5 Commands)"
        echo "-----------------------------"
	free -h 
}

cpu_usage() {
	echo "____________________________"
	echo "Cpu Usage info"
	echo "____________________________"
	top -b -n 1 | head -n 12 | tail -n 6 
}

main() {
	os_info
	uptime_status
	disk_usage
	mem_usage
	cpu_usage
}
echo " calling the main function "
main
