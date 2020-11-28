##
# R Script to visualize COVID-19 mobility data by Google
# This specific version of the script generates charts for
# Macedonia & Thrace area / Greece/
#
# Script Author: Apostolos Kritikos <akritiko@csd.auth.gr>
# Script Version (Date): v1.0 (2020-11-27)
#
# Data available at: https://www.google.com/covid19/mobility/
# Data documentation / Threats to validity available at: 
# https://support.google.com/covid19-mobility/answer/9825414?hl=en&ref_topic=9822927
#
# License: This script is provided under the Apache 2.0 License: 
# https://www.apache.org/licenses/LICENSE-2.0.html
#
# All the data are provided by Google. 
##

### Imports & Settings ###
library(psych)       
library(psychTools)
library(gridExtra)
library(xtable)
library(dplyr)
library(ggplot2)
options(max.print = .Machine$integer.max)

### Read data from CSV ###
#setwd('/mnt/b5d8c462-b987-49ea-86df-1169b4a962db/PHD EXPERIMENTS/Google Mobility/')
setwd('C:\\akritiko\\google mobility\\')
myData <- read.csv(file="mobility_gr.csv", head=TRUE, sep=",") 

### Separate Administrations in Greece and calculate average values ###
# 01. Decentralized Administration of Attica
# 02. Decentralized Administration of Crete
# 03. Decentralized Administration of Epirus and Western Macedonia
# 04. Decentralized Administration of Macedonia and Thrace
# 05. Decentralized Administration of Peloponnese, Western Greece and the Ionian
# 06. Decentralized Administration of the Aegean
# 07. Decentralized Administration of Thessaly and Central Greece

administrations = list(
        "Decentralized Administration of Attica",
        "Decentralized Administration of Crete",
        "Decentralized Administration of Epirus and Western Macedonia",
        "Decentralized Administration of Macedonia and Thrace",
        "Decentralized Administration of Peloponnese, Western Greece and the Ionian",
        "Decentralized Administration of the Aegean",
        "Decentralized Administration of Thessaly and Central Greece")

# All averages
for (i in 1:length(administrations)) {
        thefilename = paste(administrations[[i]],"- 01 - Average Mobility.svg")
        adminitration_data <- filter(myData, myData$sub_region_1 == administrations[[i]])
        adminitration_data$Avg_score = rowMeans(adminitration_data[,c(9,10,11,12,13,14)])
        
        svg(thefilename)
        plot(adminitration_data$Avg_score~as.Date(adminitration_data$date,"%Y-%m-%d"), type = "l", col="black", lwd=2, 
             main = "Μέση κινητικότητα",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim = c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        
        dev.off()
        
        thefilename = paste(administrations[[i]],"- 02 - Activities.svg")
        # GROUP PLOTS TO 1 PAGE
        svg(thefilename)
        par(mfrow=c(3,2))
        
        # DESIGN SEPARATE PLOTS
        # Retail & Recreation
        #svg("002_retail_recreation.svg")
        plot(adminitration_data$retail_and_recreation_percent_change_from_baseline~as.Date(adminitration_data$date,"%Y-%m-%d"), type = "l", col="black", lwd=2,                                # Change main title & axis labels
             main = "Λιανική & Ψυχαγωγία",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim = c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        #dev.off()
        
        # Grocery & Pharmacy
        #svg("003_grocery_pharmacy.svg")
        plot(adminitration_data$grocery_and_pharmacy_percent_change_from_baseline~as.Date(adminitration_data$date,"%Y-%m-%d"), type = "l", col="black", lwd=2,                                # Change main title & axis labels
             main = "Αγορές Τροφίμων & Φαρμακεία",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim = c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        #dev.off()
        
        # Parks
        #svg("004_parks.svg")
        plot(adminitration_data$parks_percent_change_from_baseline~as.Date(adminitration_data$date,"%Y-%m-%d"), type = "l", col="black", lwd=2,                                # Change main title & axis labels
             main = "Πάρκα",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim = c(-250,250))
        abline(h=(seq(-250,250,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        #dev.off()
        
        # Transit
        #svg("005_transit.svg")
        plot(adminitration_data$transit_stations_percent_change_from_baseline~as.Date(adminitration_data$date,"%Y-%m-%d"), type = "l", col="black", lwd=2,                                # Change main title & axis labels
             main = "Δημόσιες συγκοινωνίες",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim = c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        #dev.off()
        
        # Workplaces
        #svg("006_workplaces.svg")
        plot(adminitration_data$workplaces_percent_change_from_baseline~as.Date(adminitration_data$date,"%Y-%m-%d"), type = "l", col="black", lwd=2,                                # Change main title & axis labels
             main = "Χώροι εργασίας",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim = c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        #dev.off()
        
        # Residential
        #svg("007_residential.svg")
        plot(adminitration_data$residential_percent_change_from_baseline~as.Date(adminitration_data$date,"%Y-%m-%d"), type = "l", col="black", lwd=2,                                # Change main title & axis labels
             main = "Κατοικίες",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim = c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        
        dev.off()
        
        ### (1st Lockdown: 23/03/2020 - 04/05/2020) ###
        
        # Filter the right dates
        adminitration_data_lock1 <- adminitration_data
        adminitration_data_lock1$date <- as.Date(adminitration_data_lock1$date, format= "%Y-%m-%d")
        adminitration_data_lock1 <- filter(adminitration_data_lock1, adminitration_data_lock1$date >= "2020-03-23" & adminitration_data_lock1$date <= "2020-05-04")
        
        # Calculate AVG mobility from all subsets
        adminitration_data_lock1$Avg_score = rowMeans(adminitration_data_lock1[,c(9,10,11,12,13,14)])
        
        # Average
        thefilename = paste(administrations[[i]],"- 03 - Average Mobility - Lockdown 1.svg")
        svg(thefilename)
        plot(adminitration_data_lock1$Avg_score~as.Date(adminitration_data_lock1$date,"%Y-%m-%d"), type = "l", col="blue", lwd=2,
             main = "1ο Lockdown / Μέση κινητικότητα",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim=c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        dev.off()
        
        # GROUP PLOTS TO 1 PAGE
        thefilename = paste(administrations[[i]],"- 04 - Activies - Lockdown 1.svg")
        svg(thefilename)
        par(mfrow=c(3,2))
        
        # DESIGN SEPARATE PLOTS
        # Retail & Recreation
        #svg("002_retail_recreation.svg")
        plot(adminitration_data_lock1$retail_and_recreation_percent_change_from_baseline~as.Date(adminitration_data_lock1$date,"%Y-%m-%d"), type = "l", col="blue", lwd=2,                                # Change main title & axis labels
             main = "1ο Lockdown / Λιανική & Ψυχαγωγία",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim=c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        #dev.off()
        
        # Grocery & Pharmacy
        #svg("003_grocery_pharmacy.svg")
        plot(adminitration_data_lock1$grocery_and_pharmacy_percent_change_from_baseline~as.Date(adminitration_data_lock1$date,"%Y-%m-%d"), type = "l", col="blue", lwd=2,                                # Change main title & axis labels
             main = "1ο Lockdown / Αγορές Τροφίμων & Φαρμακεία",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim=c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        #dev.off()
        
        # Parks
        #svg("004_parks.svg")
        plot(adminitration_data_lock1$parks_percent_change_from_baseline~as.Date(adminitration_data_lock1$date,"%Y-%m-%d"), type = "l", col="blue", lwd=2,                                # Change main title & axis labels
             main = "1ο Lockdown / Πάρκα",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim=c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        #dev.off()
        
        # Transit
        #svg("005_transit.svg")
        plot(adminitration_data_lock1$transit_stations_percent_change_from_baseline~as.Date(adminitration_data_lock1$date,"%Y-%m-%d"), type = "l", col="blue", lwd=2,                                # Change main title & axis labels
             main = "1ο Lockdown / Δημόσιες συγκοινωνίες",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim=c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        #dev.off()
        
        # Workplaces
        #svg("006_workplaces.svg")
        plot(adminitration_data_lock1$workplaces_percent_change_from_baseline~as.Date(adminitration_data_lock1$date,"%Y-%m-%d"), type = "l", col="blue", lwd=2,                                # Change main title & axis labels
             main = "1ο Lockdown / Χώροι εργασίας",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim=c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        #dev.off()
        
        # Residential
        #svg("007_residential.svg")
        plot(adminitration_data_lock1$residential_percent_change_from_baseline~as.Date(adminitration_data_lock1$date,"%Y-%m-%d"), type = "l", col="blue", lwd=2,                                # Change main title & axis labels
             main = "1ο Lockdown / Κατοικίες",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim=c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        #dev.off()
        
        dev.off()
        
        ### (2nd Lockdown: 05/11/2020 - NOW. Thessaloniki from 29/10/2020 - NOW) ###
        
        # Filter the right dates
        adminitration_data_lock2 <- adminitration_data
        adminitration_data_lock2$date <- as.Date(adminitration_data_lock2$date, format= "%Y-%m-%d")
        adminitration_data_lock2 <- filter(adminitration_data_lock2, adminitration_data_lock2$date >= "2020-10-29" & adminitration_data_lock2$date <= "2020-12-07")
        
        # Calculate AVG mobility from all subsets
        adminitration_data_lock2$Avg_score = rowMeans(adminitration_data_lock2[,c(9,10,11,12,13,14)])
        
        # Average
        thefilename = paste(administrations[[i]],"- 05 - Average Lockdown 2.svg")
        svg(thefilename)
        plot(adminitration_data_lock2$Avg_score~as.Date(adminitration_data_lock2$date,"%Y-%m-%d"), type = "l", col="darkgreen", lwd=2,
             main = "2ο Lockdown / Μέση κινητικότητα",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim=c(-150,150))
        abline(h=(seq(-150,1500,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        dev.off()
        
        # GROUP PLOTS TO 1 PAGE
        
        thefilename = paste(administrations[[i]],"- 06 - Activities - Lockdown 2.svg")
        svg(thefilename)
        par(mfrow=c(3,2))
        
        # DESIGN SEPARATE PLOTS
        # Retail & Recreation
        #svg("002_retail_recreation.svg")
        plot(adminitration_data_lock2$retail_and_recreation_percent_change_from_baseline~as.Date(adminitration_data_lock2$date,"%Y-%m-%d"), type = "l", col="darkgreen", lwd=2,                                # Change main title & axis labels
             main = "2ο Lockdown / Λιανική & Ψυχαγωγία",
             xlab = "μήνας",
             ylim=c(-150,150))
        abline(h=(seq(-150,1500,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        #dev.off()
        
        # Grocery & Pharmacy
        #svg("003_grocery_pharmacy.svg")
        plot(adminitration_data_lock2$grocery_and_pharmacy_percent_change_from_baseline~as.Date(adminitration_data_lock2$date,"%Y-%m-%d"), type = "l", col="darkgreen", lwd=2,                                # Change main title & axis labels
             main = "2ο Lockdown / Αγορές Τροφ. & Φαρμακεία",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim=c(-150,150))
        abline(h=(seq(-150,1500,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        #dev.off()
        
        # Parks
        #svg("004_parks.svg")
        plot(adminitration_data_lock2$parks_percent_change_from_baseline~as.Date(adminitration_data_lock2$date,"%Y-%m-%d"), type = "l", col="darkgreen", lwd=2,                                # Change main title & axis labels
             main = "2ο Lockdown / Πάρκα",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim=c(-150,150))
        abline(h=(seq(-150,1500,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        #dev.off()
        
        # Transit
        #svg("005_transit.svg")
        plot(adminitration_data_lock2$transit_stations_percent_change_from_baseline~as.Date(adminitration_data_lock2$date,"%Y-%m-%d"), type = "l", col="darkgreen", lwd=2,                                # Change main title & axis labels
             main = "2ο Lockdown / Δημόσιες συγκοινωνίες",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim=c(-150,150))
        abline(h=(seq(-150,1500,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        #dev.off()
        
        # Workplaces
        #svg("006_workplaces.svg")
        plot(adminitration_data_lock2$workplaces_percent_change_from_baseline~as.Date(adminitration_data_lock2$date,"%Y-%m-%d"), type = "l", col="darkgreen", lwd=2,                                # Change main title & axis labels
             main = "2ο Lockdown / Χώροι εργασίας",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim=c(-150,150))
        abline(h=(seq(-150,1500,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        #dev.off()
        
        # Residential
        #svg("007_residential.svg")
        plot(adminitration_data_lock2$residential_percent_change_from_baseline~as.Date(adminitration_data_lock2$date,"%Y-%m-%d"), type = "l", col="darkgreen", lwd=2,                               # Change main title & axis labels
             main = "2ο Lockdown / Κατοικίες",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim=c(-150,150))
        abline(h=(seq(-150,1500,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        #dev.off()
        
        dev.off()
        
        ### D. Cross Plots - Lockdowns ###
        
        # Retail & Recreation
        thefilename = paste(administrations[[i]],"- 07 - Crosscheck Retail.svg")
        svg(thefilename)
        par(mfrow=c(2,1))
        plot(adminitration_data_lock1$retail_and_recreation_percent_change_from_baseline~as.Date(adminitration_data_lock1$date,"%Y-%m-%d"), type = "l", col="blue", lwd=2,                                # Change main title & axis labels
             main = "Lockdown 1 / Λιανική & Ψυχαγωγία",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim=c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        
        plot(adminitration_data_lock2$retail_and_recreation_percent_change_from_baseline~as.Date(adminitration_data_lock2$date,"%Y-%m-%d"), type = "l", col="darkgreen", lwd=2,                               # Change main title & axis labels
             main = "Lockdown 2 / Λιανική & Ψυχαγωγία",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             xlim = as.Date(c("2020-10-29", "2020-12-04")),
             ylim=c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        
        dev.off()
        
        # Grocery & Pharmacy
        thefilename = paste(administrations[[i]],"- 08 - Crosscheck Grocery.svg")
        svg(thefilename)
        par(mfrow=c(2,1))
        plot(adminitration_data_lock1$grocery_and_pharmacy_percent_change_from_baseline~as.Date(adminitration_data_lock1$date,"%Y-%m-%d"), type = "l", col="blue", lwd=2,                                # Change main title & axis labels
             main = "Lockdown 1 / Αγορές Τρ. & Φαρμακεία",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim=c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        
        plot(adminitration_data_lock2$grocery_and_pharmacy_percent_change_from_baseline~as.Date(adminitration_data_lock2$date,"%Y-%m-%d"), type = "l", col="darkgreen", lwd=2,                               # Change main title & axis labels
             main = "Lockdown 2 / Αγορές Τρ. & Φαρμακεία",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             xlim = as.Date(c("2020-10-29", "2020-12-04")),
             ylim=c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        dev.off()
        
        
        # Parks
        thefilename = paste(administrations[[i]],"- 09 - Crossckech Parks.svg")
        svg(thefilename)
        par(mfrow=c(2,1))
        plot(adminitration_data_lock1$parks_percent_change_from_baseline~as.Date(adminitration_data_lock1$date,"%Y-%m-%d"), type = "l", col="blue", lwd=2,                                # Change main title & axis labels
             main = "Lockdown 1 / Πάρκα",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim=c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        
        plot(adminitration_data_lock2$parks_percent_change_from_baseline~as.Date(adminitration_data_lock2$date,"%Y-%m-%d"), type = "l", col="darkgreen", lwd=2,                               # Change main title & axis labels
             main = "Lockdown 2 / Πάρκα",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             xlim = as.Date(c("2020-10-29", "2020-12-04")),
             ylim=c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        
        dev.off()
        
        # Transit
        thefilename = paste(administrations[[i]],"- 10 - Crosscheck Transit.svg")
        svg(thefilename)
        par(mfrow=c(2,1))
        plot(adminitration_data_lock1$transit_stations_percent_change_from_baseline~as.Date(adminitration_data_lock1$date,"%Y-%m-%d"), type = "l", col="blue", lwd=2,                                # Change main title & axis labels
             main = "Lockdown 1 / Μετακίνηση",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim=c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        
        plot(adminitration_data_lock2$transit_stations_percent_change_from_baseline~as.Date(adminitration_data_lock2$date,"%Y-%m-%d"), type = "l", col="darkgreen", lwd=2,                               # Change main title & axis labels
             main = "Lockdown 2 / Μετακίνηση",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             xlim = as.Date(c("2020-10-29", "2020-12-04")),
             ylim=c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        
        dev.off()
        
        # Workplace
        thefilename = paste(administrations[[i]],"- 11 - Crosscheck Workplace.svg")
        svg(thefilename)
        par(mfrow=c(2,1))
        plot(adminitration_data_lock1$workplaces_percent_change_from_baseline~as.Date(adminitration_data_lock1$date,"%Y-%m-%d"), type = "l", col="blue", lwd=2,                                # Change main title & axis labels
             main = "Lockdown 1 / Χώροι εργασίας",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim=c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        
        plot(adminitration_data_lock2$workplaces_percent_change_from_baseline~as.Date(adminitration_data_lock2$date,"%Y-%m-%d"), type = "l", col="darkgreen", lwd=2,                               # Change main title & axis labels
             main = "Lockdown 2 / Χώροι εργασίας",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             xlim = as.Date(c("2020-10-29", "2020-12-04")),
             ylim=c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        
        dev.off()
        
        # Residential
        thefilename = paste(administrations[[i]],"- 11 - Crosscheck Residential.svg")
        svg(thefilename)
        par(mfrow=c(2,1))
        plot(adminitration_data_lock1$residential_percent_change_from_baseline~as.Date(adminitration_data_lock1$date,"%Y-%m-%d"), type = "l", col="blue", lwd=2,                                # Change main title & axis labels
             main = "Lockdown 1 / Κατοικίες",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             ylim=c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        
        plot(adminitration_data_lock2$residential_percent_change_from_baseline~as.Date(adminitration_data_lock2$date,"%Y-%m-%d"), type = "l", col="darkgreen", lwd=2,                               # Change main title & axis labels
             main = "Lockdown 2 / Χώροι Κατοικίες",
             xlab = "μήνας",
             ylab = "% επί του baseline",
             xlim = as.Date(c("2020-10-29", "2020-12-04")),
             ylim=c(-150,150))
        abline(h=(seq(-150,150,5)), col="lightgray", lty="dotted", lwd=0.5)
        abline(h=0, col="red")
        
        dev.off()
}
