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

# From the /data/csv folder
for file in data/csv/*.csv

# Reformat all .csv files to .json using csv2json.py script
do
  fileIn="$file"
  theFile=$(basename "$file")
  theFilename="${theFile%.*}"
  fileOut="data/json/$theFilename.json"
  if [ $theFile = "nomothesia_pandektis.csv" ]; then
	python3 csv2json.py "$fileIn" "$fileOut" -S ";"
  else
	python3 csv2json.py "$fileIn" "$fileOut"
  fi 
  
done
exit 0
