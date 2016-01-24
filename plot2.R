# get the data
power <- read.table(file="household_power_consumption.txt", 
                    sep=";", header=TRUE, na.strings = "?")
# subset the right dates
p2 <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))

# combine date and time variables into a "datetime" variable
datetime <- paste(p2$Date, p2$Time, sep= " ")

# convert "datetime" to POSIXct
datetime2<-strptime(p2$datetime, "%d/%m/%Y %H:%M:%S")

# create the line graph
png(file="plot2.png")
plot(p2$datetime2, p2$Global_active_power, 
     type = "line", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()
