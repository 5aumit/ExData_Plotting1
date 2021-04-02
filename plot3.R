data <- read.table("household_power_consumption.txt",  
                   header = TRUE, sep = ";") 
print(data)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data1 <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

plot(data1$Sub_metering_1 ~ data1$Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
lines(data1$Sub_metering_2 ~ data1$Datetime,col='Red')
lines(data1$Sub_metering_3 ~ data1$Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()