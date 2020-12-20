###
# Title: covid19gr - Apple Mobility Trends Reports
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
# 
# Original Dataset by: Apple
# Original Dataset's URL: https://covid19.apple.com/mobility
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
options(max.print = .Machine$integer.max)

# Set the datasets directory.
setwd('C:\\akritiko\\github\\covid19gr\\data\\csv')

# Parse Lockdowns dataset. Consumes CSV. 
# First row contains headers and "," is used as a separator.
lockdown_data <- read.csv(file="helper_lockdowns_gr.csv", head=TRUE, sep=",")

# Parse date columns as dates.
lockdown_data$start_date <- as.Date(lockdown_data$start_date, format= "%Y-%m-%d")
lockdown_data$end_date <- as.Date(lockdown_data$end_date, format= "%Y-%m-%d")

# Parse Apple Mobility dataset. Consumes CSV. 
# First row contains headers and "," is used as a separator.
mobility_data <- read.csv(file="apple_mobility_report.csv", head=TRUE, sep=",")

# Filters records refering to Greece.
apple <- filter(mobility_data, mobility_data$subregion_and_city == "Total")
apple$date <- as.Date(apple$date, format= "%Y-%m-%d")

# Define lockdowns dataframe. 
# - Number of the week of the lockdown
# - Mean driving per week
# - Mean walking per week

# Lockdown 1.
lock1 <- data.frame(week_number = integer(), mean_driving = double(), mean_walking = double()) 

for (i in 1:10) {
  temp_week <- filter(apple, apple$date >= lockdown_data[c(i), c(4)] & apple$date <= lockdown_data[c(i), c(5)])
  lock1[ nrow(lock1) + 1, ] <- list(i, round(mean(temp_week$driving)),  round(mean(temp_week$walking)))
}

# Lockdown 2.
lock2 <- data.frame(week_number = integer(), mean_driving = double(), mean_walking = double()) 

for (i in 11:17) {
  temp_week <- filter(apple, apple$date >= lockdown_data[c(i), c(4)] & apple$date <= lockdown_data[c(i), c(5)])
  lock2[ nrow(lock2) + 1, ] <- list(i, round(mean(temp_week$driving)),  round(mean(temp_week$walking)))
}

