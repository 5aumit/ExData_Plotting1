#loading data
data <- read.table("household_power_consumption.txt",  
                   header = TRUE, sep = ";") 
print(data)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data1 <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

globalActivePower <- as.numeric(as.character(data1$Global_active_power))

plot(data1$Global_active_power~data1$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()