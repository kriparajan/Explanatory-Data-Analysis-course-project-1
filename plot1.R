setwd("C:/Users/Kripa/Desktop/R programming Directory")

## load the data 
rm(list = ls())
globaldata<- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

## convert the date variable to Date class
globaldata$Date <- as.Date(globaldata$Date, format = "%d/%m/%Y")

## Subset the data
globaldata <- subset(globaldata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert dates and times
globaldata$datetime <- strptime(paste(globaldata$Date, globaldata$Time), "%Y-%m-%d %H:%M:%S")

## Plot 1
attach(globaldata)
hist(Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",ylab="Frequency", col = "Red")

## Save a copy of the file as PNG file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(globaldata)