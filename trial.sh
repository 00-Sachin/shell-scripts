#!/bin/bash


#6 finding the top 5 most occured Error msg 

#7. The pipeline: Extract -> Sort -> Count -> Sort Descending -> Top 5
# 
# sort -nr
TOP_5_ERRORS=$(grep -i "ERROR" "sample.log" | sort | head -n 5)

echo "--- Top 5 Error Messages ---"
echo "$TOP_5_ERRORS"
echo ""

