library(lubridate)
power<- read.csv("./household_power_consumption.txt",header=TRUE,sep =";",na.strings="?")

power$Date <- as.Date(power$Date,"%d/%m/%Y")

powerfeb <- subset(power,power$Date==as.Date("2007-02-01")|power$Date==as.Date("2007-02-02"))

powerfeb$datetime <- paste(powerfeb$Date, powerfeb$Time)
powerfeb$datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S")

powerfeb$weekday <- wday(powerfeb$datetime,label=TRUE)

plot(powerfeb$datetime,powerfeb$Sub_metering_1, ylab="Engery sub metering", xlab="", type="n")
with(powerfeb, lines(datetime,Sub_metering_1))
with(powerfeb, lines(datetime,Sub_metering_2, col="red"))
with(powerfeb, lines(datetime,Sub_metering_3, col="blue"))
legend("topright", lty=1, col = c("black","red","blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Copy my plot to a PNG file
dev.copy(png, file = "./plot3.png", width = 480, height = 480)

## Don't forget to close the PNG device!
dev.off()