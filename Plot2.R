#Plot 2

# get the Library file
library(tidyverse)

#Read in the data file, set na to "?" (deals with the numeric values) and get the necessary 2 days

setwd("~/coursera/EDA")
dataIn <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE,dec = ".", na.strings = "?")
hpc <- dataIn[dataIn$Date %in% c("1/2/2007","2/2/2007") ,]

#Set the time to POSIX

hpc$Date <- strptime(hpc$Date, "%d/%m/%Y")
a <- paste(hpc$Date, hpc$Time, collapse = NULL)
hpc$Time <- strptime(a,format="%Y-%m-%d %H:%M:%S")

#Create the necessary file to plot and write it to a png file

png("plot2.png", width=480, height=480)
plot(hpc$Time, hpc$Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")
dev.off()
