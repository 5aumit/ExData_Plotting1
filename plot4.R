data <- read.table("household_power_consumption.txt",  
                   header = TRUE, sep = ";") 
print(data)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data1 <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(data1$Global_active_power ~ data1$Datetime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

plot(data1$Voltage ~ data1$Datetime, type="l", 
     ylab="Voltage (volt)", xlab="")

plot(data1$Sub_metering_1 ~ data1$Datetime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
lines(data1$Sub_metering_2 ~ data1$Datetime,col='Red')
lines(data1$Sub_metering_3 ~ data1$Datetime,col='Blue')

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data1$Global_reactive_power ~ data1$Datetime, type="l", 
     ylab="Global Rective Power (kilowatts)",xlab="")


dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()