#!/bin/bash

###
# Script Name: json2csv.sh 
# Script Author: Apostolos Kritikos <akritiko@csd.auth.gr>
# Script Version: 1.0, Dec 20th, 2020 
# Script License: Public Domain, CC0-1.0
# Script License URL: https://github.com/akritiko/covid19gr/blob/master/LICENSE
#
# NOTE: This script is part of the covid19gr project: https://github.com/akritiko/covid19gr
# 
##

python3 json2csv.py "data/json/vaccinations_regions.json" "data/csv/vaccinations_regions.csv"