PowerCons <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)

PowerCons$DateTime <- as.POSIXct(paste(PowerCons$Date, PowerCons$Time),format = "%d/%m/%Y %H:%M:%S")
PowerCons$Date <- as.Date(PowerCons$Date, format = "%d/%m/%Y")
Data<- subset(PowerCons, ((Date == as.Date("2007-02-01")) | (Date == as.Date("2007-02-02"))) )

Data$Sub_metering_1 <- as.numeric(Data$Sub_metering_1)
Data$Sub_metering_2 <- as.numeric(Data$Sub_metering_2)
Data$Sub_metering_3 <- as.numeric(Data$Sub_metering_3)

with(Data, plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "" ))
with(Data, points(DateTime, Sub_metering_1, type = "l"))
with(Data, points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(Data, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright",pch="-", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))

dev.copy(png, 'plot3.png',height = 480, width = 480)
dev.off
