## Plot 2

## Read Power data
power <- read.csv("household_power_consumption.txt", sep = ";")

## Change Date column to date format.  
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power$Time <- strptime(power$Time, format="%H:%M:%S")

## Convert Global Active Power to numeric type
power$Global_active_power <- as.numeric(power$Global_active_power)

## Subsets just 1-2 Feb 2007 data
power2 <- subset(power, Date == "2007-2-1" | Date == "2007-2-2" )

## Format Time column to POSIXlt
power2[1:1440, "Time"] <- format(power2[1:1440,"Time"],
                                "2007-02-01 %H:%M:%S")
power2[1441:2880,"Time"] <- format(power2[1441:2880,"Time"],
                                "2007-02-02 %H:%M:%S")

# Plot on screen
plot(power2$Time, power2$Global_active_power,
     type = "l", lwd = 2,
     ylab = "Global Active Power (kilowatts)",
     xlab = ""
     )

## Save file as PNG
png(file = "plot2.png")

plot(power2$Time, power2$Global_active_power,
     type = "l", lwd = 2,
     ylab = "Global Active Power (kilowatts)",
     xlab = ""
      )

dev.off()