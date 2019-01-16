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

# Plot 3
data$dateTime <- strptime(paste(data$Date,data$Time), format= "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)
plot(y=data$Sub_metering_1, x=data$dateTime, typ="l",
     ylab="Energy sub metering", xlab="")
lines(y=data$Sub_metering_2, x=data$dateTime, col="red")
lines(y=data$Sub_metering_3, x=data$dateTime, col="blue")
legend("topright", names(data)[7:9], lty=1, col=c("black", "red", "blue"))
dev.off()

