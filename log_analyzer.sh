#!/bin/bash

# 1. Ensuring that the path argument did not left 


if [ "$#" -ne 1 ]; then
       echo "Error: Missing log file path."
       echo "usage : $0 <path_to_log_file>"
       exit 1
fi

# 2. checking if the path actually exist or not

log_path="$1" 

if [ ! -f "$log_path" ]; then 
	echo "$log_path doesnot exist "
	echo "Please enter a valid path"
	exit 1
fi

# 3. Count lines containing "ERROR" or "Failed"
# Using -E for multiple patterns, -i for case-insensitivity, and -c to count

ERROR_COUNT="$(grep -i -E -c "ERROR|Failed" "$log_path")"

# 4. Print the total error count to the console
echo "Total errors/failures found: $ERROR_COUNT" 

# 5. Searching and printing the lines that conatins CRITICAL

CRITICAL_EVENTS=$(grep -ni "CRITICAL" "$log_path" | awk '{print "line: " $0}')

echo "-----Critical Events-----"

echo "$CRITICAL_EVENTS"

#6 finding the top 5 most occured Error msg 

#7. The pipeline: Extract -> Sort -> Count -> Sort Descending -> Top 5

TOP_5_ERRORS="$(grep -i "ERROR" "$log_path"| cut -c 21- | sort | uniq -c | sort -nr | head -n 5)"

echo "--- Top 5 Error Messages ---"
echo "$TOP_5_ERRORS"
echo ""

# 6. Gather remaining data for the report
CURRENT_DATE=$(date +"%Y-%m-%d")
REPORT_FILE="log_report_${CURRENT_DATE}.txt"
TOTAL_LINES=$(wc -l < "$log_path")

# 7. Generate the report using the variables we already saved!
{
    echo "========================================"
    echo "          LOG ANALYSIS REPORT           "
    echo "========================================"
    echo "Date of analysis: $(date +"%Y-%m-%d %H:%M:%S")"
    echo "Log file name: $log_path"
    echo "Total lines processed: $TOTAL_LINES"
    echo "Total error count: $ERROR_COUNT"
    echo ""
    echo "--- Top 5 Error Messages ---"
    # Just print the variable instead of running grep again!
    echo "$TOP_5_ERRORS" 
    echo ""
    echo "--- Critical Events (with line numbers) ---"
    echo "$CRITICAL_EVENTS"
    echo "========================================"
} > "$REPORT_FILE"

echo "Report successfully generated: $REPORT_FILE"
