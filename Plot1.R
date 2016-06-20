household_power_consumption <- read.csv("~/Desktop/takefile/household_power_consumption.txt", sep=";")
asubset <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007"),]
GAP <- as.numeric(asubset$Global_active_power)
png(filename='Plot1.png', width=480, height=480)
hist(GAP, main = "Global Active Power", col = "red", xlab = "Global Active Power(kilowatts)")
dev.off()
