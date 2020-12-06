# Unzip the .zip file
library ("downloader")
url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download(url, dest="dataset.zip", mode="wb") 
unzip ("dataset.zip", exdir = "C:\\Users\\Knies\\Desktop\\CourseraR")

# Import text file.
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = '?')

#Filter Dates

library (dplyr)

data2 <- data %>% filter(Date == "1/2/2007"|Date == "2/2/2007")

dateandtime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Save into a PNG file
png(file = "plot4.png", width = 480, height = 480)

#Plot the Graph

par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

#First and Second Graph

plot (dateandtime, data2$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power")
plot (dateandtime, data2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#Third Plot

#Plot the Graph

plot (dateandtime, data2$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")
lines (dateandtime, data2$Sub_metering_2, col = "red")
lines (dateandtime, data2$Sub_metering_3, col = "blue")

#Create legend

legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)

#Fourth Plot

plot (dateandtime, data2$Global_reactive_power, type = "l", xlab = " ", ylab = "Global Reactive Power")

# Close the PNG device.
dev.off() 
