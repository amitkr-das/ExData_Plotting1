library(dplyr)
library(lubridate)

## Retaining the Header of the data set

header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)

## reading relevant data

data <- read.table("household_power_consumption.txt", sep = ";", skip = 66636, nrows = 2880, 
                   header = TRUE)

## Merging the header name with the dataset

colnames(data) <- unlist(header)

Date <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Plot the graphs and create the plot4.png file

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(Date, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(Date, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(Date, data$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
lines(Date, data$Sub_metering_2, col="red", type="l")
lines(Date, data$Sub_metering_3, col="blue", type="l")
legend("topright", col=c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(Date, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
