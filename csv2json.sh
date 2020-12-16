#!/bin/bash

# From the /data/csv folder
for file in data/csv/*.csv

# Reformat all .csv files to .json 
# using csv2json.py script
do
  fileIn="$file"
  theFile=$(basename "$file")
  theFilename="${theFile%.*}"
  fileOut="data/json/$theFilename.json"
  python3 csv2json.py "$fileIn" "$fileOut"
done

exit 0