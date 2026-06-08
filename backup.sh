#!/bin/bash

directory_path() {
	echo "please enter the source and destination path in the exact flow"
	exit 1
}

if [ $# -lt 2 ] ; then
	directory_path
fi

source_path="$1"
destination_path="$2"

# check the source exist 

if [ ! -d "$source_path" ]; then 
       echo "ERROR : Source directory '$source_path' does not exist."
	exit 1
fi

archive() {
	
	# Define the full path for the output file
        
	local archive_name="$destination_path/backup-$(date +%Y-%m-%d).tar.gz"
	
	# Run tar with the output file first, then use -C to go to source, then . for content
	tar -czvf "$archive_name" -C "$source_path" .
	
	if [ $? -eq 0 ] ; then
		
		echo "Archive file created successfully: $archive_name"

		#Print file size as requested

		echo "Archive size is: $(du -sh "$archive_name" | cut -f1)"
		
	fi

	echo "Archive file are:-  "
	echo "$(find $destination_path -name *.tar.gz -type f)"
}

delete_old_backups() {
	
	find $destination_path -name *.tar.gz -type f -mtime +14 -delete
}

archive
delete_old_backups
