## Plot 4

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

## Set up 2x2 frame, and plot each graph into it
par(mfrow = c(2,2))


plot(power2$Time, power2$Global_active_power,
     type = "l", lwd = 2,
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
plot(power2$Time, power2$Voltage,
       type = "l", lwd = 2,
       ylab = "Voltage",
       xlab = "datetime")
plot(power2$Time, power2$Sub_metering_1,
          type = "n",
          xlab = "", ylab ="Energy sub metering")
      with(power2, lines(Time, Sub_metering_1, col = "black"))
      with(power2, lines(Time, Sub_metering_2, col = "red"))
      with(power2, lines(Time, Sub_metering_3, col = "blue"))
      legend("topright", lty=1, 
           col=c("black","red","blue"),
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(power2$Time, power2$Global_active_power,
             type = "l", lwd = 2,
             ylab = "Global_active_power",
             xlab = "datetime")

## Save file as PNG
png(file = "plot4.png")

par(mfrow = c(2,2))


plot(power2$Time, power2$Global_active_power,
     type = "l", lwd = 2,
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
plot(power2$Time, power2$Voltage,
     type = "l", lwd = 2,
     ylab = "Voltage",
     xlab = "datetime")
plot(power2$Time, power2$Sub_metering_1,
     type = "n",
     xlab = "", ylab ="Energy sub metering")
with(power2, lines(Time, Sub_metering_1, col = "black"))
with(power2, lines(Time, Sub_metering_2, col = "red"))
with(power2, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", lty=1, 
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(power2$Time, power2$Global_active_power,
     type = "l", lwd = 2,
     ylab = "Global_active_power",
     xlab = "datetime")

dev.off()
      