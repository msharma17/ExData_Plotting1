#Reading data 

powerfile <- "household_power_consumption.txt"
data <- read.table(powerfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Reading the data from the dates "2007-02-01" and "2007-02-02"

subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
GlobalActivePower <- as.numeric(subsetdata$Global_active_power)

#Re-constructing the first plot and saving it as "plot1.png" file

png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Close the PNG device
dev.off()

