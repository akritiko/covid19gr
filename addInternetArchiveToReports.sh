#!/bin/bash

###
# Script Name: csv2json.sh 
# Script Author: Apostolos Kritikos <akritiko@csd.auth.gr>
# Script Version: 1.0, Dec 20th, 2020 
# Script License: Public Domain, CC0-1.0
# Script License URL: https://github.com/akritiko/covid19gr/blob/master/LICENSE
#
# NOTE: This script is part of the covid19gr project: https://github.com/akritiko/covid19gr
# 
##

# Open reports csv

awk -F"," '{ $3 = "https://web.archive.org/web/*/"$2; print }' data/csv/covid19_reports.csv > data/csv/covid19_reports.csv

exit 0

