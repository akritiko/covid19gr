###    
# Title: covid19gr - COVID-19 Checks. National Transparency Agency Greece
# Script Author: Apostolos Kritikos <akritiko@csd.auth.gr>
# Script Version: 1.0, Jan 9th, 2021 
# Script License: Public Domain, CC0-1.0
# Script License URL: https://github.com/akritiko/covid19gr/blob/master/LICENSE
#
# NOTE: This script is part of the covid19gr project: https://github.com/akritiko/covid19gr
# 
# CITATION (optional): 
# Apostolos Kritikos. (2020, December 15). akritiko/covid19gr: Aristotle (Version v1.0.0). 
# Zenodo. http://doi.org/10.5281/zenodo.4323541.
# 
# Original Dataset by: National Transparency Agency Greece
# Original Dataset's URL: https://github.com/akritiko/covid19gr/blob/master/data/csv/covid_checks.csv
##

# Imports libraries 
library(psych)       
library(psychTools)
library(gridExtra)
library(xtable)
library(dplyr)
library(ggplot2)
library(formattable)
library(tidyr)
library(data.table)
library(jsonlite)
options(max.print = .Machine$integer.max)

# Set the datasets directory.
setwd('/mnt/b5d8c462-b987-49ea-86df-1169b4a962db/04_github/covid19gr/data/csv')

# Parse Apple Mobility dataset. Consumes CSV. 
# First row contains headers and "," is used as a separator.
perifereies <- read.csv(file="helper_perifereies.csv", head=TRUE, sep=",", dec=".", stringsAsFactors=FALSE)

# Parse Lockdowns dataset. Consumes CSV. 
# First row contains headers and "," is used as a separator.
lockdown_data <- read.csv(file="helper_lockdowns_gr.csv", head=TRUE, sep=",")

# Parse date columns as dates.
lockdown_data$start_date <- as.Date(lockdown_data$start_date, format= "%Y-%m-%d")
lockdown_data$end_date <- as.Date(lockdown_data$end_date, format= "%Y-%m-%d")

# Parse Apple Mobility dataset. Consumes CSV. 
# First row contains headers and "," is used as a separator.
checks_data <- read.csv(file="covid_checks.csv", head=TRUE, sep=",", dec=".", stringsAsFactors=FALSE)
checks_data$date <- as.Date(checks_data$date, format= "%Y-%m-%d")

total_fines = sum(as.numeric(checks_data$fines_euro), na.rm = TRUE)
total_checks = sum(as.numeric(checks_data$region_totals), na.rm = TRUE)
total_violations = sum(as.numeric(checks_data$violations), na.rm = TRUE)
total_calls = sum(as.numeric(checks_data$calls_1520), na.rm = TRUE)
business_closed = sum(as.numeric(checks_data$business_closed), na.rm = TRUE)
total_checks_uncorr = sum(as.numeric(checks_data$checks), na.rm = TRUE)
total_pop = 10815197

#regions
final <- data.frame(
  region_name = as.numeric(),
  checks_total = as.numeric(),
  checks_percentage = as.numeric(),
  population_total = as.numeric(),
  population_percentage = as.numeric()
) 

for(i in 14:ncol(checks_data)) {       # for-loop over columns
  thename <- perifereies[c(i-13), c(2)]
  thesum <- sum(as.numeric(checks_data[ , i]), na.rm = TRUE)
  theper <- round(thesum / total_checks * 100)
  thepop <- perifereies[c(i-13), c(4)]
  thepopper <- round(thepop / total_pop * 100)
  
  final[ nrow(final) + 1, ] <- c(thename, thesum, theper, thepop, thepopper)
}

final[ nrow(final) + 1, ] <- c("Σύνολα", total_checks, "100", total_pop, "100")

# Set the datasets directory for exports.
setwd('/mnt/b5d8c462-b987-49ea-86df-1169b4a962db/04_github/covid19gr/analysis/covid-checks')

exportJSON <- toJSON(final)
write(exportJSON, "checks_regions.json")
write.csv(final,"checks_regions.csv", row.names = FALSE)

#totals
checks_summary <- data.frame( 
  totalFines = as.numeric(),
  totalChecksRegions = as.numeric(),
  totalChecks = as.numeric(),
  totalViolations = as.numeric(),
  totalCalls = as.numeric(),
  totalBusinessClosed = as.numeric()
)

checks_summary[ nrow(checks_summary) + 1, ] <- c(total_fines, total_checks, total_checks_uncorr, total_violations, total_calls, business_closed)

exportJSON <- toJSON(checks_summary)
write(exportJSON, "checks_total.json")
write.csv(checks_summary,"checks_total.csv", row.names = FALSE)
