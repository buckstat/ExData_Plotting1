#Plot 3

library(tidyverse)

setwd("~/coursera/EDA")
dataIn <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE,dec = ".", na.strings = "?")
hpc <- dataIn[dataIn$Date %in% c("1/2/2007","2/2/2007") ,]


hpc$Date <- strptime(hpc$Date, "%d/%m/%Y")
a <- paste(hpc$Date, hpc$Time, collapse = NULL)
hpc$Time <- strptime(a,format="%Y-%m-%d %H:%M:%S")


png("plot3.png", width=480, height=480)
plot(hpc$Time, hpc$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(hpc$Time, hpc$Sub_metering_2,  col = "red")
lines(hpc$Time, hpc$Sub_metering_3, col = "blue")
legend( "topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),col=c("black","red","blue"), lty=c(1,1,1))
dev.off()
