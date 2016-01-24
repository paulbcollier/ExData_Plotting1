# get the data
power <- read.table(file="household_power_consumption.txt", 
                    sep=";", header=TRUE, na.strings = "?")
# subset the right dates
p2 <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))

# combine date and time variables into a "datetime" variable
datetime <- paste(p2$Date, p2$Time, sep= " ")

# convert "datetime" to POSIXct
datetime2<-strptime(p2$datetime, "%d/%m/%Y %H:%M:%S")

# plot the histogram to a PNG
png(file="plot1.png")
hist(p2$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab= "Frequency", col ="red")
dev.off()
