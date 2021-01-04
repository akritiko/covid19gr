###
# Title: covid19gr - Google Mobility Community Reports
# Script Name: google.r
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
# Original Dataset by: Google
# Original Dataset's URL: https://www.google.com/covid19/mobility/
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
library(reshape2)
#library(hrbrthemes)
library(plotly)
library(fmsb)
options(max.print = .Machine$integer.max)

# Set the datasets directory.
#setwd('C:\\akritiko\\github\\covid19gr\\data\\csv')
setwd('/mnt/b5d8c462-b987-49ea-86df-1169b4a962db/04_github/covid19gr/data/csv/')

# Parse Lockdowns dataset. Consumes CSV. 
# First row contains headers and "," is used as a separator.
lockdown_data <- read.csv(file="helper_lockdowns_gr.csv", head=TRUE, sep=",")

# Parse date columns as dates.
lockdown_data$start_date <- as.Date(lockdown_data$start_date, format= "%Y-%m-%d")
lockdown_data$end_date <- as.Date(lockdown_data$end_date, format= "%Y-%m-%d")

lock_counts <- lockdown_data %>% count(lockdown_number)
lock1_count <- lock_counts[c(1), c(2)]
lock2_count <- lock_counts[c(2), c(2)]

# Parse Google Mobility dataset. Consumes CSV. 
# First row contains headers and "," is used as a separator.
mobility_data <- read.csv(file="2020_GR_Region_Mobility_Report.csv", head=TRUE, sep=",")

# List of Decentralized Administrations of Greece (in English).
administrations = list(
  "Decentralized Administration of Attica",
  "Decentralized Administration of Crete",
  "Decentralized Administration of Epirus and Western Macedonia",
  "Decentralized Administration of Macedonia and Thrace",
  "Decentralized Administration of Peloponnese, Western Greece and the Ionian",
  "Decentralized Administration of the Aegean",
  "Decentralized Administration of Thessaly and Central Greece")

# List of Decentralized Administrations of Greece (in Greek).
administrations_gr = list(
  "Αποκεντρωμένη Διοίκηση Αττικής", 
  "Αποκεντρωμένη Διοίκηση Κρήτης", 
  "Αποκεντρωμένη Διοίκηση Ηπείρου και Δυτικής Μακεδονίας",
  "Αποκεντρωμένη Διοίκηση Μακεδονίας και Θράκης",
  "Αποκεντρωμένη Διοίκηση Πελοποννήσου, Δυτικής Ελλάδας και Ιονίου",
  "Αποκεντρωμένη Διοίκηση Αιγαίου",
  "Αποκεντρωμένη Διοίκηση Θεσσαλίας και Κεντρικής Ελλάδας")

# 01. Decentralized Administration of Attica
# 02. Decentralized Administration of Crete
# 03. Decentralized Administration of Epirus and Western Macedonia
# 04. Decentralized Administration of Macedonia and Thrace
# 05. Decentralized Administration of Peloponnese, Western Greece and the Ionian
# 06. Decentralized Administration of the Aegean
# 07. Decentralized Administration of Thessaly and Central Greece

# Choose a number based on the above list to produce the report for the respective decentralized 
# administration. For example for i <- 4 the Macedonia & Thrace report is being produced.
selected_adm <- 4

# Filters records refering to the selected administration, selected_adm.
google <- filter(mobility_data, mobility_data$sub_region_1 == administrations[[selected_adm]])
# Parse date fields as dates.
google$date <- as.Date(google$date, format= "%Y-%m-%d")
# Add average mobility scores to the dataframe using the mean of the respective columns.
google$avg_score = rowMeans(google[,c(9,10,11,12,13,14)])

# Define lockdowns dataframe. 
# - Number of the week of the lockdown
# - Mean of average mobility per week
# - Mean of retail per week
# - Mean of grocery per week
# - Mean of parks per week
# - Mean of transit per week
# - Mean of workplace per week
# - Mean of residence per week

# Lockdown 1.
lock1 <- data.frame(week_number = integer(),mean_total = double(), mean_retail = double(), mean_grocery = double(), mean_parks = double(), mean_transit = double(), mean_workplaces = double(), mean_residential = double()) 

for (i in 1:lock1_count) {
  temp_week <- filter(google, google$date >= lockdown_data[c(i), c(4)] & google$date <= lockdown_data[c(i), c(5)])
  lock1[ nrow(lock1) + 1, ] <- list(i, round(mean(temp_week$avg_score)),  round(mean(temp_week$retail_and_recreation_percent_change_from_baseline)),  round(mean(temp_week$grocery_and_pharmacy_percent_change_from_baseline)),  round(mean(temp_week$parks_percent_change_from_baseline)),  round(mean(temp_week$transit_stations_percent_change_from_baseline)),  round(mean(temp_week$workplaces_percent_change_from_baseline)),  round(mean(temp_week$residential_percent_change_from_baseline)))
}

# Lockdown 2.
lock2 <- data.frame(week_number = integer(),mean_total = double(), mean_retail = double(), mean_grocery = double(), mean_parks = double(), mean_transit = double(), mean_workplaces = double(), mean_residential = double()) 

for (i in (lock1_count + 1):(lock1_count + lock2_count)) {
  temp_week <- filter(google, google$date >= lockdown_data[c(i), c(4)] & google$date <= lockdown_data[c(i), c(5)])
  lock2[ nrow(lock2) + 1, ] <- list(i-lock1_count, round(mean(temp_week$avg_score)),  round(mean(temp_week$retail_and_recreation_percent_change_from_baseline)),  round(mean(temp_week$grocery_and_pharmacy_percent_change_from_baseline)),  round(mean(temp_week$parks_percent_change_from_baseline)),  round(mean(temp_week$transit_stations_percent_change_from_baseline)),  round(mean(temp_week$workplaces_percent_change_from_baseline)),  round(mean(temp_week$residential_percent_change_from_baseline)))
}

lock2[ nrow(lock2) + 1, ] <- c(NA)
lock2[ nrow(lock2) + 1, ] <- c(NA)


for(i in 1:lock1_count) {
  
  thenames <- colnames(lock1)
  test <- data.frame(matrix(ncol=7,nrow=0))
  names(test) <- thenames[c(2:8)]

  test[  nrow(test) + 1, ] <- list(seq(-100,-100,length.out=7))
  test[  nrow(test) + 1, ] <- list(seq(0,0,length.out=7))
  test[  nrow(test) + 1, ] <- lock1[c(i),c(2:8)]
  
  thefn = paste("lockdown1", "week", i, ".png", sep = "_") 
  png(filename=thefn)
  radarchart(test,
             axistype=1, 
             pcol='red',
             pfcol=adjustcolor("pink", alpha.f = 0.3),
             plwd=3, 
             cglcol='grey',
             cglty=1,
             axislabcol='black',
             cglwd=1,
             vlcex=1.1,
             title=paste('Google Mobility - Week', i, sep = " ")
  )
  graphics.off()

}

for(i in 1:lock2_count) {
  
  thenames <- colnames(lock1)
  test <- data.frame(matrix(ncol=7,nrow=0))
  names(test) <- thenames[c(2:8)]
  
  test[  nrow(test) + 1, ] <- list(seq(-100,-100,length.out=7))
  test[  nrow(test) + 1, ] <- list(seq(0,0,length.out=7))
  test[  nrow(test) + 1, ] <- lock2[c(i),c(2:8)]
  
  thefn = paste("lockdown2", "week", i, ".png", sep = "_") 
  png(filename=thefn)
  radarchart(test,
             axistype=1, 
             pcol='blue',
             pfcol=adjustcolor("cyan", alpha.f = 0.3),
             plwd=3, 
             cglcol='grey',
             cglty=1,
             axislabcol='black',
             cglwd=1,
             vlcex=1.1,
             title=paste('Google Mobility - Week', i, sep = " ")
  )
  graphics.off()
  
}
