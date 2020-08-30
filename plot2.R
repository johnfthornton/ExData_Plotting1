PowerCons <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)

PowerCons$DateTime <- as.POSIXct(paste(PowerCons$Date, PowerCons$Time),format = "%d/%m/%Y %H:%M:%S")
PowerCons$Date <- as.Date(PowerCons$Date, format = "%d/%m/%Y")
Data<- subset(PowerCons, ((Date == as.Date("2007-02-01")) | (Date == as.Date("2007-02-02"))) )


Data$Global_active_power <- as.numeric(Data$Global_active_power)

plot(Data$DateTime, Data$Global_active_power, type = "l", ylab = "GLobal Active Power(kilowatts)", xlab  ="")

dev.copy(png, 'plot2.png',height = 480, width = 480)
dev.off