x <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data <- subset(x,x$Date %in% c("1/2/2007","2/2/2007"))
data$Global_active_power <- as.numeric(data$Global_active_power)


data$datetime <- strptime(paste(as.Date(data$Date, format = "%d/%m/%Y"), data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)
png("plot2.png",width=480,height=480)
with(data,plot(datetime,Global_active_power, type = "l",
               ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()