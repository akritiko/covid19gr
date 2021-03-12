#!/bin/bash

###
# Script Name: aggregate_govgr_data.py 
# Script Author: Apostolos Kritikos <akritiko@csd.auth.gr>
# Script Version: 1.0, Dec 20th, 2020 
# Script License: Public Domain, CC0-1.0
# Script License URL: https://github.com/akritiko/covid19gr/blob/master/LICENSE
#
# NOTE: This script is part of the covid19gr project: https://github.com/akritiko/covid19gr
# 
##

import requests
import json
from datetime import date

# Gets today's date in YYYY-MM-DD format (i.e. 2020-01-21)
today = date.today()
todayday = today.strftime("%Y-%m-%d")

# Retrieves data via FOV.GR api service (requires certified API KEY)
url = 'https://data.gov.gr/api/v1/query/mdg_emvolio?date_from=2020-12-28&date_to=' + todayday
headers = {'Authorization':'Token 5a6d256d24beff349a83e03c16e96f1f59062995'}
response = requests.get(url, headers=headers)

# Creates the vaccinations_regions.json. encoding and ensure_ascii parameters ensure that 
# our code respects Greek characters' encoding. 
with open('data/json/vaccinations_regions.json', 'w', encoding='utf8') as json_file:
    json.dump(response.json(), json_file, ensure_ascii=False)
