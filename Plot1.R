#PLot 1

library(tidyverse)

setwd("~/coursera/EDA")
dataIn <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")
hpc <- dataIn[dataIn$Date %in% c("1/2/2007","2/2/2007") ,]


hpc$Date <- strptime(hpc$Date, "%d/%m/%Y")
a <- paste(hpc$Date, hpc$Time, collapse = NULL)
hpc$Time <- strptime(a,format="%Y-%m-%d %H:%M:%S")

png("plot1.png", width=480, height=480)
hist(hpc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
dev.off()
