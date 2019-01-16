# Assignment 1 of Getting and Cleaning Data by Nino Pozar

# Installing and loading required packages
required_packages <- c("dplyr")
packages_to_install <- required_packages[!(required_packages %in% installed.packages()[,"Package"])]
if(length(packages_to_install)) install.packages(packages_to_install)

library(dplyr)

# Setting working directory
setwd("C:/Users/Nino/Desktop/Data Science/Exploratory Data Analysis/EDA_assignment1")

# Load data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, dec=".", na.string="?")
data <- data %>%
  filter(Date %in% c("1/2/2007", "2/2/2007"))

# Plot 1
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col="red",
     xlab= "Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()
