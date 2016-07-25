#Data is read, appropriate dates subsetted, 
#     descriptive variable names and DateTime variable added
data1 <- read.table("household_power_consumption.txt", sep=";")
dataToUse <- data[data$V1 == "1/2/2007" | data$V1 == "2/2/2007",]
names(dataToUse) <- c("Date","Time","Global_active_power","Global_reactive_power",
                      "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                      "Sub_metering_3")
dataToUse$Date <- factor(dataToUse$Date)
dataToUse$Date <- as.Date(dataToUse$Date, format="%d/%m/%Y")
dataToUse$DateTime <- as.POSIXlt(paste(dataToUse$Date, dataToUse$Time))
dataToUse$Global_active_power <- as.numeric(dataToUse$Global_active_power)
dataToUse$Global_reactive_power <- as.numeric(dataToUse$Global_reactive_power)
dataToUse$Voltage <- as.numeric(dataToUse$Voltage)
dataToUse$Global_intensity <- as.numeric(dataToUse$Global_intensity)
dataToUse$Sub_metering_1 <- as.numeric(dataToUse$Sub_metering_1)
dataToUse$Sub_metering_2 <- as.numeric(dataToUse$Sub_metering_2)
dataToUse$Sub_metering_3 <- as.numeric((dataToUse$Sub_metering_3))


#plot4
par(mfrow=c(2,2))

#First plot
plot(dataToUse$DateTime, dataToUse$Global_active_power, pch=".", 
     ylab="Global Active Power (kilowatts)", xlab="")
lines(dataToUse$DateTime, y = dataToUse$Global_active_power, type = "l")

#Second plot
plot(dataToUse$DateTime, dataToUse$Voltage, pch=".", ylab="Voltage", xlab="datetime")
lines(dataToUse$DateTime, dataToUse$Voltage, type="l")


#Third plot
plot(dataToUse$DateTime, dataToUse$Sub_metering_1, pch=".", 
     ylab="Energy sub metering", xlab="")
lines(dataToUse$DateTime, dataToUse$Sub_metering_1, type="l")
lines(dataToUse$DateTime, dataToUse$Sub_metering_2, type="l", col="red")
lines(dataToUse$DateTime, dataToUse$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), lwd=c(2,2,2),col=c("black", "red", "blue"))

#Fourth plot
plot(dataToUse$DateTime, dataToUse$Global_reactive_power, 
     pch=".", ylab="Global_reactive_power", xlab="datetime")
lines(dataToUse$DateTime, dataToUse$Global_reactive_power, type="l")

dev.copy(png, file="plot4.png")
dev.off()
