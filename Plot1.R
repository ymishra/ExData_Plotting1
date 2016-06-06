test <- household_power_consumption
SubsetData <- test[test$Date %in% c("1/2/2007","2/2/2007"),]
GlobalActivePower <- as.numeric(SubsetData$Global_active_power)
hist(GlobalActivePower, xlab= "Global Active Power(kilowatts)", main= "Global Active Power", col="red")