PowerCons <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)

PowerCons$DateTime <- as.POSIXct(paste(PowerCons$Date, PowerCons$Time),format = "%d/%m/%Y %H:%M:%S")
PowerCons$Date <- as.Date(PowerCons$Date, format = "%d/%m/%Y")
Data<- subset(PowerCons, ((Date == as.Date("2007-02-01")) | (Date == as.Date("2007-02-02"))) )

Data$Global_reactive_power  <- as.numeric(Data$Global_reactive_power)
Data$Voltage <- as.numeric(Data$Voltage)
Data$Sub_metering_1 <- as.numeric(Data$Sub_metering_1)
Data$Sub_metering_2 <- as.numeric(Data$Sub_metering_2)
Data$Sub_metering_3 <- as.numeric(Data$Sub_metering_3)

par(mfrow = c(2,2))

##plot 1
plot(Data$DateTime, Data$Global_active_power, type = "l", ylab = "GLobal Active Power", xlab  ="")

##plot 2
plot(Data$DateTime, Data$Voltage, type = "l", ylab = "Voltage", xlab  ="datetime")

##plot 3

with(Data, plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
with(Data, points(DateTime, Sub_metering_1, type = "l"))
with(Data, points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(Data, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright",pch="-",lty= 1, lwd=2,  legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))

##plot 4
plot(Data$DateTime, Data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab  ="datetime")

dev.copy(png, 'plot4.png',height = 480, width = 480)
dev.off
