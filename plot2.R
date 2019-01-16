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

# Plot 2
data$dateTime <- strptime(paste(data$Date,data$Time), format= "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(y=data$Global_active_power, x=data$dateTime, typ="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

