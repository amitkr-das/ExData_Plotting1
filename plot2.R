library(dplyr)
library(lubridate)

## Retaining the Header of the data set

header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)

## reading relevant data

data <- read.table("household_power_consumption.txt", sep = ";", skip = 66636, nrows = 2880, 
                   header = TRUE)

## Merging the header name with the dataset

colnames(data) <- unlist(header)

## Plot the Line Graph and create the plot2.png file

Date <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

plot(Date, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file = 'plot2.png', width = 480, height = 480)

dev.off()


