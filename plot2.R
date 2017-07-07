setwd("C:/Users/Kripa/Desktop/R programming Directory")

## load the data from directory
rm(list = ls())
globaldata <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

## convert the date variable to Date class just as in Plot1
globaldata$Date <- as.Date(globaldata$Date, format = "%d/%m/%Y")

## Subset the data just as in plot1
globaldata <- subset(globaldata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert dates and times just as in plot1
globaldata$datetime <- strptime(paste(globaldata$Date, globaldata$Time), "%Y-%m-%d %H:%M:%S")

## Plot2
globaldata$datetime <- as.POSIXct(globaldata$datetime)
attach(globaldata)
plot(Global_active_power ~ datetime, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")

## save a copy of the PNG file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(globaldata)