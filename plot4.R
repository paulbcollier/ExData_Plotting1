# get the data
power <- read.table(file="household_power_consumption.txt", 
                    sep=";", header=TRUE, na.strings = "?")
# subset the right dates
p2 <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))

# combine date and time variables into a "datetime" variable
datetime <- paste(p2$Date, p2$Time, sep= " ")

# convert "datetime" to POSIXct
datetime2<-strptime(p2$datetime, "%d/%m/%Y %H:%M:%S")

# set up device
png(file="plot4.png")

# set up a 4 x 4 matrix
par(mfrow = c(2, 2))
par(mar = c(4, 4, 2, 2))

# create Global Active Power graph
plot(p2$datetime2, p2$Global_active_power, xlab="", ylab=
             "Global Active Power", type="line")

# create Voltage graph
plot(p2$datetime2, p2$Voltage, xlab="datetime", ylab="Voltage", type="line")

# create sub-meter graph
        plot(p2$datetime2, p2$Sub_metering_1, type = "n", ylab = 
                     "Energy sub metering", xlab = "")

        #add lines for each sub-meter 
        lines(p2$datetime2, p2$Sub_metering_1)
        lines(p2$datetime2, p2$Sub_metering_2, col="red")
        lines(p2$datetime2, p2$Sub_metering_3, col="blue")

        # add a legend
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
                                      "Sub_metering_3"), 
       lwd = 1, col = c("black", "red", "blue"), bty="n")

#Create Global Reactive Power graph
plot(p2$datetime2, p2$Global_reactive_power, 
     xlab="datetime", ylab="Global_reactive_power", 
     type="line")

# stop drawing graph
dev.off()
