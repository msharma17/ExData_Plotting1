#Reading the data 

powerfile <- "household_power_consumption.txt"
data <- read.table(powerfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Reading the data from the dates "2007-02-01" and "2007-02-02"

subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(subsetdata$Global_active_power)

GlobalReactivePower <- as.numeric(subsetdata$Global_reactive_power)
voltage <- as.numeric(subsetdata$Voltage)

subMetering1 <- as.numeric(subsetdata$Sub_metering_1)
subMetering2 <- as.numeric(subsetdata$Sub_metering_2)
subMetering3 <- as.numeric(subsetdata$Sub_metering_3)

#Re-constructing the plot No 4 and saving it as "plot4.png" file

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l",xlab="", ylab="Energy sub metering")

lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(1,1), col=c("black", "red", "blue"), bty="o")

plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#Close the PNG device

dev.off()
