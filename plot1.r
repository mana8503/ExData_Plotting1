## Plot 1

## Read Power data
power <- read.csv("household_power_consumption.txt", sep = ";")

## Change Date column to date format.  
power$Date <- as.Date(power$Date, "%d/%m/%Y")

## Subsets just 1-2 Feb 2007 data
power2 <- subset(power, Date == "2007-2-1" | Date == "2007-2-2" )

## Convert Global Active Power to numeric type
power$Global_active_power <- as.numeric(power$Global_active_power)

## Make Histogram on screen
hist(power2$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

## Save file as PNG
png(file = "plot1.png")

hist(power2$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()