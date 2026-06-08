#!/bin/bash
# This is for log roation 
# Important it takes a path of directory as an argument 
set -eou pipefail
check_for_argument() {

	echo "Plese provide the path as an argument of log Dric"
	exit 1 
}

if [ $# -eq 0 ] ; then
   check_for_argument
fi

log_dir_path=$1

compress_log() {

	# command used to find and compress file older then 7 days

	find $log_dir_path -name  "*.log" -type f -mtime +7 -exec gzip {} \;
	
	echo "total file compressed are $(find $log_dir_path -name "*.log.gz" -type f | wc -l)"
}
 
delete_gz() {

	echo "total file delete are $(find $log_dir_path -name "*.gz" -type f -mtime +30 | wc -l)"

	# command used to delete  the .gz files 
	
	find $log_dir_path -name "*.gz" -type f -mtime +30 -delete 

	
}

compress_log
delete_gz

