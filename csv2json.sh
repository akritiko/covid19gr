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
# CITATION (optional): 
# Apostolos Kritikos. (2020, December 15). akritiko/covid19gr: Aristotle (Version v1.0.0). 
# Zenodo. http://doi.org/10.5281/zenodo.4323541.
##

# From the /data/csv folder
for file in data/csv/*.csv

# Reformat all .csv files to .json using csv2json.py script
do
  fileIn="$file"
  theFile=$(basename "$file")
  theFilename="${theFile%.*}"
  fileOut="data/json/$theFilename.json"
  python3 csv2json.py "$fileIn" "$fileOut"
done

exit 0