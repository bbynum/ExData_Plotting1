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


#plot1
hist(dataToUse$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()
