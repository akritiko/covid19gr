#!/bin/bash

###
# Script Name: filterCSV.sh 
# Script Author: Apostolos Kritikos <akritiko@csd.auth.gr>
# Script Version: 1.0, Dec 20th, 2020 
# Script License: Public Domain, CC0-1.0
# Script License URL: https://github.com/akritiko/covid19gr/blob/master/LICENSE
#
# NOTE: This script is part of the covid19gr project: https://github.com/akritiko/covid19gr
# 
# CITATION (optional): 
# Apostolos Kritikos. (2020, December 15). akritiko/covid19gr: Aristotle (Version v1.0.0). 
# Zenodo. http://doi.org/10.5281/zenodo.4323541.
##

# 1. Read header line from .csv to a temp file
# 2. Filter with awk the relevant lines based on the regex (matching records related to Greece)
# 3. Remove the initial file
# 4. Rename the temp file with the filename of the original

# Apple Mobility Dataset
head -n 1 data/csv/apple_mobility_report.csv > data/csv/apple_mobility_report2.csv
awk -F, '$1 ~ /^Greece/ {print}' data/csv/apple_mobility_report.csv >> data/csv/apple_mobility_report2.csv
rm data/csv/apple_mobility_report.csv
mv data/csv/apple_mobility_report2.csv data/csv/apple_mobility_report.csv

# Oxfords Government Stringency Dataset
head -n 1 data/csv/OxCGRT_latest.csv > data/csv/OxCGRT_latest2.csv
awk -F, '$1 ~ /^Greece/ {print}' data/csv/OxCGRT_latest.csv >> data/csv/OxCGRT_latest2.csv
rm data/csv/OxCGRT_latest.csv
mv data/csv/OxCGRT_latest2.csv data/csv/OxCGRT_latest.csv

# TomTom Traffic Dataset
head -n 1 data/csv/tomtom_trafic_index.csv > data/csv/tomtom_trafic_index2.csv
awk -F, '$1 ~ /^Greece/ {print}' data/csv/tomtom_trafic_index.csv >> data/csv/tomtom_trafic_index2.csv
rm data/csv/tomtom_trafic_index.csv
mv data/csv/tomtom_trafic_index2.csv data/csv/tomtom_trafic_index.csv

# Quarantine Opening Risk Index Dataset
head -n 1 data/csv/riskindex_timeseries_latest.csv > data/csv/riskindex_timeseries_latest2.csv
awk -F, '$3 ~ /Greece/ {print}' data/csv/riskindex_timeseries_latest.csv >> data/csv/riskindex_timeseries_latest2.csv
rm data/csv/riskindex_timeseries_latest.csv
mv data/csv/riskindex_timeseries_latest2.csv data/csv/riskindex_timeseries_latest.csv

exit 0