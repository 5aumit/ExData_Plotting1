#loading data
data <- read.table("household_power_consumption.txt",  
                   header = TRUE, sep = ";") 
print(data)

data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

globalActivePower <- as.numeric(as.character(data1$Global_active_power))


hist(globalActivePower , main = 'Global Active Power' ,
     xlab = 'Global Active Power (kilowatts)' ,
     col = 'red',
     plot = TRUE,
     xlim = c(0,6))

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()