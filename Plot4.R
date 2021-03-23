#Plot 4
# load necessary Library
library(tidyverse)

#Read in the data file, set na to "?" (deals with the numeric values) and get the necessary 2 days

setwd("~/coursera/EDAproject1")
dataIn <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE,dec = ".", na.strings = "?")
hpc <- dataIn[dataIn$Date %in% c("1/2/2007","2/2/2007") ,]

# convert the time to POSIX times

hpc$Date <- strptime(hpc$Date, "%d/%m/%Y")
a <- paste(hpc$Date, hpc$Time, collapse = NULL)
hpc$Time <- strptime(a,format="%Y-%m-%d %H:%M:%S")

# Create the appropriate graph, and print it as a png files

png("plot4.png", width=480, height=480)
par(mar=c(4.5, 4.5, 2, 2))
par(mfrow = c(2,2))
with(hpc, {
  
  plot(Time,Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", cex.lab=0.9)
  
  plot(Time,Voltage, type = "l", xlab = "datetime", ylab = "Voltage", cex.lab = .9)
  
  plot(Time, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering", cex.lab = .9)
  lines(Time, Sub_metering_2,  col = "red")
  lines(Time, Sub_metering_3, col = "blue")
  legend( "topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),col=c("black","red","blue"), lty=c(1,1,1), cex = .9)
  
  plot(Time, Global_reactive_power, type = "l", xlab = "datetime", cex.lab = .9)
  
  
})
dev.off()

