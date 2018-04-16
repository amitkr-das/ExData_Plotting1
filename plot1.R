library(dplyr)
library(lubridate)

## Retaining the Header of the data set

header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)

## reading relevant data

data <- read.table("household_power_consumption.txt", sep = ";", skip = 66636, nrows = 2880, 
                   header = TRUE)

## Merging the header name with the dataset

colnames(data) <- unlist(header)

## Plot the Histogram and create the plot1.png file

hist(data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (killowatts)", ylab = "Frequency")

dev.copy(png, file = 'plot1.png', width = 480, height = 480)
dev.off()

