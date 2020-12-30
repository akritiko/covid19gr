###
# Title: covid19gr - TomTom Traffic Index
# Script Name: tomtom.r
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
# Original Dataset by: ActiveConclusion on Github
# Original Dataset's URL: https://github.com/ActiveConclusion/COVID19_mobility/
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

# Parse Tomtom Traffic Index dataset Consumes CSV. 
# First row contains headers and "," is used as a separator.
mobility_data <- read.csv(file="tomtom_trafic_index.csv", head=TRUE, sep=",")

# Filters records refering to Thessaloniki
tomtom_skg <- filter(mobility_data, mobility_data$city == "Thessaloniki")
# Parses date objects as dates.
tomtom_skg$date <- as.Date(tomtom_skg$date, format= "%Y-%m-%d")

# Define lockdowns dataframe. 
# - Number of the week of the lockdown
# - Mean congestion
# - Mean minutes with congestion added

# Lockdown 1.
lock1_cong_skg <- data.frame(week_number = integer(), mean_congestion = double(), mean_minutes = integer()) 

for (i in 1:10) {
  temp_week <- filter(tomtom_skg, tomtom_skg$date >= lockdown_data[c(i), c(4)] & tomtom_skg$date <= lockdown_data[c(i), c(5)])
  lock1_cong_skg[ nrow(lock1_cong_skg) + 1, ] <- list(i, mean(temp_week$congestion) / 100, 30 + round(30 * mean(temp_week$congestion / 100)) / 60)
}

# Lockdown 2.
lock2_cong_skg <- data.frame(week_number = integer(), mean_congestion = double(), mean_minutes = integer()) 

for (i in 11:17) {
  temp_week <- filter(tomtom_skg, tomtom_skg$date >= lockdown_data[c(i), c(4)] & tomtom_skg$date <= lockdown_data[c(i), c(5)])
  lock2_cong_skg[ nrow(lock2_cong_skg) + 1, ] <- list(i-10, mean(temp_week$congestion) / 100, 30 + round(30 * mean(temp_week$congestion / 100)) / 60)
}

# Filters records refering to Athens
tomtom_ath <- filter(mobility_data, mobility_data$city == "Athens")
tomtom_ath$date <- as.Date(tomtom_ath$date, format= "%Y-%m-%d")

# Define lockdowns dataframe. 
# - Number of the week of the lockdown
# - Mean congestion
# - Mean minutes with congestion added

# Lockdown 1. 
lock1_cong_ath <- data.frame(week_number = integer(), mean_congestion = double(), mean_minutes = integer()) 

for (i in 1:10) {
  temp_week <- filter(tomtom_ath, tomtom_ath$date >= lockdown_data[c(i), c(4)] & tomtom_ath$date <= lockdown_data[c(i), c(5)])
  lock1_cong_ath[ nrow(lock1_cong_ath) + 1, ] <- list(i, mean(temp_week$congestion) / 100, 30 + round(30 * mean(temp_week$congestion / 100)) / 60)
}

# Lockdown 2. 
lock2_cong_ath <- data.frame(week_number = integer(), mean_congestion = double(), mean_minutes = integer()) 

for (i in 11:17) {
  temp_week <- filter(tomtom_ath, tomtom_ath$date >= lockdown_data[c(i), c(4)] & tomtom_ath$date <= lockdown_data[c(i), c(5)])
  lock2_cong_ath[ nrow(lock2_cong_ath) + 1, ] <- list(i-10, mean(temp_week$congestion) / 100, 30 + round(30 * mean(temp_week$congestion / 100)) / 60)
}


