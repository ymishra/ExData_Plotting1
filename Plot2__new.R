household_power_consumption <- read.csv("~/Desktop/takefile/household_power_consumption.txt", sep=";")

##Prep data
#subset for 2 days
febData <- household_power_consumption[household_power_consumption$Date %in% c("2/1/2007", "2/2/2007"),]
#convert date
febData$Date <- as.Date(febData$Date, format="%m/%d/%Y")

#convert power to numeric
febData$Global_Active_Power <- as.numeric(as.character(febData$Global_active_power))
febData$Global_Reactive_Power <- as.numeric(as.character(febData$Global_reactive_power))

#convert voltage to numeric
febData$Voltage <- as.numeric(as.character(febData$Voltage))

#create date-timestamp variable
febData <- transform(febData, timestamp=as.POSIXlt(paste(Date, Time)), "%m/%d/%Y %H:%M:%S")

#sub metering
febData$Sub_metering_1 <- as.numeric(as.character(febData$Sub_metering_1))
febData$Sub_metering_2 <- as.numeric(as.character(febData$Sub_metering_2))
febData$Sub_metering_3 <- as.numeric(as.character(febData$Sub_metering_3))

summary(febData)

#Ques 2 plot GAP
png(filename = "plot2.png", width=480, height=480)
plot(febData$timestamp,febData$Global_Active_Power,xlab = "", ylab="Global Active Power(kilowatts)", type="l")
dev.off()



