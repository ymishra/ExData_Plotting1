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

#Ques 3 plot sub metering
png(filename = "plot3.png",width = 480, height = 480)
plot(febData$timestamp,febData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",  ylim=c(0,30))
lines(febData$timestamp, febData$Sub_metering_2,col="red")
lines(febData$timestamp, febData$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1, lwd = 2.5, col =c("black", "red", "blue"))
dev.off()
                                                                                            
