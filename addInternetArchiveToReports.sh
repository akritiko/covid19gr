#!/bin/bash

###
# Script Name: addInternetArchiveToReports.sh 
# Script Author: sandbird <https://github.com/Sandbird/>
# Script Version: 1.0, Mar 23rd, 2021 
# Script License: Public Domain, CC0-1.0
# Script License URL: https://github.com/akritiko/covid19gr/blob/master/LICENSE
#
# NOTE: This script is part of the covid19gr project: https://github.com/akritiko/covid19gr. 
# Special thanks to Sandbird for the invaluable help.
##

awk -F"," 'BEGIN {OFS = ","} {$3 = "https://web.archive.org/web/*/"$2; print}' data/csv/covid19_reports.csv > data/csv/covid19_reports2.csv
exit 0
