#!/bin/bash

# Function that checks the disl usage 

check_disk() {
	echo "   "
	echo "THE DISK STATUS IS..."
	df -h /
	 
}

check_memory() {
	
	echo ""
	echo "AND THE FREE MEMORY USING ARE  .."
	free -h 
}


check_disk

check_memory 

