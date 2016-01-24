# get the data
power <- read.table(file="household_power_consumption.txt", 
                    sep=";", header=TRUE, na.strings = "?")
# subset the right dates
p2 <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))

# combine date and time variables into a "datetime" variable
datetime <- paste(p2$Date, p2$Time, sep= " ")

# convert "datetime" to POSIXct
datetime2<-strptime(p2$datetime, "%d/%m/%Y %H:%M:%S")

# create the device
png(file="plot3.png")

# initialize the plot
plot(p2$datetime2, p2$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")

#add lines for each sub-meter 
lines(p2$datetime2, p2$Sub_metering_1)
lines(p2$datetime2, p2$Sub_metering_2, col="red")
lines(p2$datetime2, p2$Sub_metering_3, col="blue")

# add a legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = 1, col = c("black", "red", "blue"))

# turn off the device
dev.off()
