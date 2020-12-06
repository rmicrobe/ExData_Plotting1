# Unzip the .zip file
library ("downloader")
url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download(url, dest="dataset.zip", mode="wb") 
unzip ("dataset.zip", exdir = "C:\\Users\\Knies\\Desktop\\CourseraR")

# Import text file.
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = '?')

#Filter Dates and Format Date and Time

library (dplyr)

data2 <- data %>% filter(Date == "1/2/2007"|Date == "2/2/2007")

dateandtime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Plot the Graph

plot (dateandtime, data2$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")
lines (dateandtime, data2$Sub_metering_2, col = "red")
lines (dateandtime, data2$Sub_metering_3, col = "blue")

#Create legend

legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save into a PNG file
dev.copy(png, file = "plot3.png", width = 480, height = 480)

# Close the PNG device.
dev.off() 
