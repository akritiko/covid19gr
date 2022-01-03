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

# Vaccinations Dataset
head -n 1 data/csv/vaccinations.csv > data/csv/vaccinations2.csv
awk -F, '$1 ~ /Greece/ {print}' data/csv/vaccinations.csv >> data/csv/vaccinations2.csv
rm data/csv/vaccinations.csv
mv data/csv/vaccinations2.csv data/csv/vaccinations.csv

# COVID19 Variants Dataset
head -n 1 data/csv/covid-variants.csv > data/csv/covid-variants2.csv
awk -F, '$1 ~ /Greece/ {print}' data/csv/covid-variants.csv >> data/csv/covid-variants2.csv
rm data/csv/covid-variants.csv
mv data/csv/covid-variants2.csv data/csv/covid-variants.csv

exit 0