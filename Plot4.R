test <- household_power_consumption
SubsetData <- test[test$Date %in% c("1/2/2007","2/2/2007"),]  # Creating subset between a date range
GlobalActivePower <- as.numeric(SubsetData$Global_active_power)  #converting Active power into numeric
GlobalReactivePower <- as.numeric(SubsetData$Global_reactive_power)
subMetering1 <- as.numeric(subsetData$Sub_metering_1)
subMetering2 <- as.numeric(subsetData$Sub_metering_2)
subMetering3 <- as.numeric(subsetData$Sub_metering_3)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) # creating multilabel plots

plot(Datetime,GlobalActivePower,  type="l", ylab="Global Active Power", cex=0.2)

plot(Datetime, SubsetData$Voltage, type= "l",ylab="Voltage", xlab= "" )
plot(Datetime,subMetering1 , type="l", xlab="Datetime", ylab="Energy Submetering", col="black")
lines(Datetime,subMetering2, type="l",col="red")
lines(Datetime,subMetering3, type="l", col="blue")
legend("topright", c("Submetering_1", "Submetering_2", "Submetering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(Datetime, GlobalReactivePower, type="l", xlab= "Datetime", ylab="Global_reactive_power")
