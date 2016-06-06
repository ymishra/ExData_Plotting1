test <- household_power_consumption
AnothersubsetData <- test[ test$Date %in% c("1/2/2007", "2/2/2007"),] 
GlobalActivePower <- as.numeric(AnothersubsetData$Global_active_power)
Submetering1 <- as.numeric(AnothersubsetData$Sub_metering_1)
Submetering2 <- as.numeric(AnothersubsetData$Sub_metering_2)
Submetering3 <- as.numeric(AnothersubsetData$Sub_metering_3)
Time <- paste(AnothersubsetData$Date, AnothersubsetData$Time, sep = "")
Time1 <- strptime(Time, "%d %m %Y %H:%M:%S")
plot(Datetime, Submetering1, type="l", ylab="Energy Submetering")
lines(Datetime, Submetering2, type="l", col="red")
lines(Datetime, Submetering3, type="l", col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

