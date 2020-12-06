# Unzip the .zip file
library ("downloader")
url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download(url, dest="dataset.zip", mode="wb") 
unzip ("dataset.zip", exdir = "C:\\Users\\Knies\\Desktop\\CourseraR")

# Import text file.
data = read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = '?')

#Filter Dates

library (dplyr)

data2 <- data %>% filter(Date == "1/2/2007"|Date == "2/2/2007")

#Create graphs

hist (data2$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

#Export Graph

# Save into a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)

# Close the PNG device.
dev.off() 
