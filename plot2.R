#Reading data 

powerfile <- "household_power_consumption.txt"
data <- read.table(powerfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Reading the data from the dates "2007-02-01" and "2007-02-02"

subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(subsetdata$Global_active_power)

#Re-constructing the second plot and saving it as "plot2.png" file

png("plot2.png", width=480, height=480)
plot(datetime, GlobalActivePower, type="l",xlab="", ylab="Global Active Power (kilowatts)")

#Close the PNG device
dev.off()