library(lubridate)
power<- read.csv("./household_power_consumption.txt",header=TRUE,sep =";",na.strings="?")

power$Date <- as.Date(power$Date,"%d/%m/%Y")

powerfeb <- subset(power,power$Date==as.Date("2007-02-01")|power$Date==as.Date("2007-02-02"))

powerfeb$datetime <- paste(powerfeb$Date, powerfeb$Time)
powerfeb$datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2), mar=c(3,4,4,4))
plot(powerfeb$datetime,powerfeb$Global_active_power, ylab="Global Active Power", xlab="", type="l")

plot(powerfeb$datetime,powerfeb$Voltage, ylab="Voltage", xlab="datetime", type="l")

plot(powerfeb$datetime,powerfeb$Sub_metering_1, ylab="Engery sub metering", xlab="", type="n")
with(powerfeb, lines(datetime,Sub_metering_1))
with(powerfeb, lines(datetime,Sub_metering_2, col="red"))
with(powerfeb, lines(datetime,Sub_metering_3, col="blue"))
legend("topright", lty=1, col = c("black","red","blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(powerfeb$datetime,powerfeb$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")

## Copy my plot to a PNG file
dev.copy(png, file = "./plot4.png", width = 480, height = 480)

## Don't forget to close the PNG device!
dev.off()