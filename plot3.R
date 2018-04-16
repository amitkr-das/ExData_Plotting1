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

## Plot the Line graph and create the plot3.png file

plot(Date, data$Sub_metering_1, ylab="Energy Sub metering", xlab="", type="l")
lines(Date, data$Sub_metering_2, col="red", type="l")
lines(Date, data$Sub_metering_3, col="blue", type="l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty = 1, lwd = 2)

dev.copy(png, file = 'plot3.png', width = 480, height = 480)
dev.off()
