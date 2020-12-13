#!/bin/bash

for file in data/csv/*.csv
do
  fileIn="$file"
  theFile=$(basename $file)
  theFilename="${theFile%.*}"
  fileOut="data/json/$theFilename.json"
  python3 csv2json.py $fileIn $fileOut
done

# Remove large files that Github does not support
rm data/json/apple_mobility_report.json
rm data/json/OxCGRT_latest.json

exit 0
