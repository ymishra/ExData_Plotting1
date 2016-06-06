test <- household_power_consumption
subsetData <- test[test$Date %in% c("1/2/2007", "2/21/2007")]
GlobalActivePower <- as.numeric(subsetData$Global_active_power)
Datetime1 <- paste(subsetData$Date, subsetData$Time, sep = " ")
Datetime <- strptime(Datetime1,"%d/%m/%Y %H:%M:%S")
plot(Datetime, GlobalActivePower, type="l", xlab="DateTime", ylab="Global Active Power(kilowatts)")



