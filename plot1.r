x <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data <- subset(x,x$Date %in% c("1/2/2007","2/2/2007"))

data$Global_active_power <- as.numeric(data$Global_active_power)
png("plot1.png",width=480,height=480)
with(data,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()
