x <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data <- subset(x,x$Date %in% c("1/2/2007","2/2/2007"))

data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$datetime <- strptime(paste(as.Date(data$Date, format = "%d/%m/%Y"), data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)

png("plot4.png",width=480,height=480)
par(mfrow = c(2, 2)) 
with(data,plot(datetime,Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))

with(data,plot(datetime,Voltage, type = "l", ylab = "Voltage",xlab="datetime"))

with(data,plot(datetime,Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "",col="black"))
with(data,lines(datetime,Sub_metering_2,col="red"))
with(data,lines(datetime,Sub_metering_3,col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

with(data,plot(datetime,Global_reactive_power,type="l"))
dev.off()