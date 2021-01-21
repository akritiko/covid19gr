#!/bin/bash

###
# Script Name: aggregate.sh 
# Script Author: Apostolos Kritikos <akritiko@csd.auth.gr>
# Script Version: 1.0, Dec 20th, 2020 
# Script License: Public Domain, CC0-1.0
# Script License URL: https://github.com/akritiko/covid19gr/blob/master/LICENSE
#
# NOTE: This script is part of the covid19gr project: https://github.com/akritiko/covid19gr
# 
##


# Download Sandbird's data from Github.
git clone https://github.com/Sandbird/covid19-Greece.git
# Keep only .csv files.
cd covid19-Greece/
rm greece.json
rm README.md
cd ../
# Move them to the data folder and remove download.
cp -R covid19-Greece/* data/csv/
rm -Rf covid19-Greece/

# Download iMEdD-Lab data from Github.
wget https://raw.githubusercontent.com/iMEdD-Lab/open-data/master/COVID-19/greeceTimeline.csv
wget https://raw.githubusercontent.com/iMEdD-Lab/open-data/master/COVID-19/greece_cases_v2.csv
wget https://raw.githubusercontent.com/iMEdD-Lab/open-data/master/COVID-19/greece_deaths_v2.csv
wget https://raw.githubusercontent.com/iMEdD-Lab/open-data/master/COVID-19/schools.csv

# Download Oxford Covid-19 Government Response Tracker data from Github.
# 1. Opening Risk Index
# 2. Government Measures Stringency Index
wget https://github.com/OxCGRT/covid-policy-scratchpad/raw/master/risk_of_openness_index/data/riskindex_timeseries_latest.csv
wget https://github.com/OxCGRT/covid-policy-tracker/raw/master/data/OxCGRT_latest.csv

# Download mobility data.
# 1. Google
# 2. Apple
# 3. TomTom

# Google (download -> unzip -> move the file related to Greece to /csv -> remove unwanted material)
wget https://www.gstatic.com/covid19/mobility/Region_Mobility_Report_CSVs.zip
unzip Region_Mobility_Report_CSVs.zip -d googlemobility/
cp googlemobility/2020_GR_Region_Mobility_Report.csv data/csv/
rm -Rf googlemobility/
rm Region_Mobility_Report_CSVs.zip

# Apple
wget https://github.com/ActiveConclusion/COVID19_mobility/raw/master/apple_reports/apple_mobility_report.csv

# TomTom
wget https://github.com/ActiveConclusion/COVID19_mobility/raw/master/tomtom_reports/tomtom_trafic_index.csv

# Download vaccination data (worldwide) from Our World in Data (OWiD)
wget https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/vaccinations.csv

# Move rest of the downloads to data
cp riskindex_timeseries_latest.csv data/csv/
cp OxCGRT_latest.csv data/csv/
cp tomtom_trafic_index.csv data/csv/
cp apple_mobility_report.csv data/csv/
cp vaccinations.csv data/csv/
cp greeceTimeline.csv data/csv/
cp greece_cases_v2.csv data/csv/
cp greece_deaths_v2.csv data/csv/
cp schools.csv data/csv/

# Clean up!
rm riskindex_timeseries_latest.csv
rm OxCGRT_latest.csv
rm tomtom_trafic_index.csv
rm apple_mobility_report.csv
rm vaccinations.csv
rm greeceTimeline.csv
rm greece_cases_v2.csv 
rm greece_deaths_v2.csv 
rm schools.csv

exit 0
