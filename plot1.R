PowerCons <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)
PowerCons$Date <- as.Date(PowerCons$Date,format = "%d/%m/%Y")
PowerCons$Time <- strptime(PowerCons$Time,format = "%H:%M:%S")

Data<- subset(PowerCons, ((Date == as.Date("2007-02-01")) | (Date == as.Date("2007-02-02"))) )

Data$Global_active_power <- as.numeric(Data$Global_active_power)
hist(Data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts")

dev.copy(png, 'plot1.png',height = 480, width = 480)
dev.off